import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/services/google_auth_service.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();

  final SupabaseClient _client =
      locator<SupabaseApiService>().supabaseInstance.client;
  final GoogleAuthService _googleAuthService = locator<GoogleAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorText;
  String? get errorText => _errorText;

  final int maxOtpAttempts = 3;
  final int otpTimeFrame = 300; // 5 minutes in seconds

  static const String otpRequestKey = CacheKeys.otpRequestKey;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signUp() async {
    // Validate the form
    if (!signUpFormKey.currentState!.validate()) {
      _errorText = "Please fill in all fields";
      notifyListeners();
      return;
    }

    // Check if the user can request an OTP
    if (!await canRequestOtp()) {
      _errorText = "Too many OTP requests. Please wait before trying again.";
      notifyListeners();
      return;
    }

    setLoading(true);

    try {
      // Trigger OTP request
      await _client.auth.signInWithOtp(
        email: emailController.text.trim(),
        shouldCreateUser: true,
      );

      // Record this OTP request
      await recordOtpRequest();

      // Navigate to OTP verification view
      _navigationService.navigateToOtpView(email: emailController.text.trim());
    } on AuthException catch (e) {
      // Handle Supabase-specific auth exceptions
      _errorText = e.message;
      notifyListeners();
    } catch (e) {
      // Handle generic exceptions
      _errorText = e.toString();
      notifyListeners();
    } finally {
      setLoading(false);
    }
  }

  /// Check if the user can request an OTP based on recent attempts
  Future<bool> canRequestOtp() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;

    // Get existing timestamps
    final timestamps =
        prefs.getStringList(otpRequestKey)?.map(int.parse).toList() ?? [];

    // Remove timestamps older than the timeframe
    timestamps
        .removeWhere((timestamp) => now - timestamp > otpTimeFrame * 1000);

    // Save updated timestamps
    await prefs.setStringList(
      otpRequestKey,
      timestamps.map((timestamp) => timestamp.toString()).toList(),
    );

    // Allow only if attempts are below the limit
    return timestamps.length < maxOtpAttempts;
  }

  /// Record a new OTP request
  Future<void> recordOtpRequest() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;

    // Get existing timestamps
    final timestamps = prefs
            .getStringList(
              otpRequestKey,
            )
            ?.map(int.parse)
            .toList() ??
        [];

    // Add the new request
    timestamps.add(now);

    // Save updated timestamps
    await prefs.setStringList(
      otpRequestKey,
      timestamps.map((timestamp) => timestamp.toString()).toList(),
    );
  }

  /// Clear the error message
  void clearError() {
    _errorText = null;
    notifyListeners();
  }

  /// Handle Google Sign-Up
  Future<void> signUpWithGoogle() async {
    setLoading(true);
    try {
      await _googleAuthService.signInWithGoogle();
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
