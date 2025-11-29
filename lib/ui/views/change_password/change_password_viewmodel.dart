import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/local/cache_manager.dart';
import 'package:streakit/services/google_auth_service.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/ui/widget/custom_snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SupabaseClient _client =
      locator<SupabaseApiService>().supabaseInstance.client;
  final GoogleAuthService _googleAuthService = locator<GoogleAuthService>();

  SnackbarType _snackbarType = SnackbarType.error;
  SnackbarType get snackbarType => _snackbarType;

  String? _errorText;
  String? get errorText => _errorText;

  // Controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> changePassword({
    required BuildContext context,
  }) async {
    try {
      if (!formKey.currentState!.validate()) {
        _errorText = "Please fill in all fields";
        _snackbarType = SnackbarType.error;
        notifyListeners();
        return;
      }

      if (confirmPasswordController.text != newPasswordController.text) {
        _errorText = "Passwords do not match";
        _snackbarType = SnackbarType.error;
        notifyListeners();
        return;
      } else {
        await _client.auth.updateUser(
          UserAttributes(password: newPasswordController.text),
        );
        logout();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await CacheManager.deleteKey(key: CacheKeys.userLoggedInKey);
      await _googleAuthService.googleSignIn?.signOut();
      await _client.auth.signOut();
      await _navigationService.clearStackAndShow(Routes.registerView);
    } catch (e) {
      rethrow;
    }
  }

  void clearError() {
    _errorText = null;
    _snackbarType = SnackbarType.error;
    notifyListeners();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void goBack() {
    _navigationService.back();
  }
}
