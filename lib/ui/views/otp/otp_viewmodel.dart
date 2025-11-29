import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/local/cache_manager.dart';
import 'package:streakit/brick/models/users.model.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/repository/user_repository.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/ui/widget/custom_snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpViewModel extends BaseViewModel {
  final String email;
  OtpViewModel({required this.email});
  final NavigationService _navigationService = locator<NavigationService>();
  final SupabaseClient _client =
      locator<SupabaseApiService>().supabaseInstance.client;
  final UserDBRepository _userDBService = UserDBRepository();
  final UserService _userService = locator<UserService>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SnackbarType _snackbarType = SnackbarType.error;
  SnackbarType get snackbarType => _snackbarType;

  String? _errorText;
  String? get errorText => _errorText;

  String? _token;
  set token(String? value) {
    _token = value;
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clearError() {
    _errorText = null;
    notifyListeners();
  }

  Future<void> signUser() async {
    setLoading(true); // Start loading

    try {
      if (_token != null) {
        final user = await _client.auth
            .verifyOTP(type: OtpType.magiclink, email: email, token: _token);

        _handleUserCreation(
          user: user.user,
          email: user.user?.email,
        );
      } else {
        _snackbarType = SnackbarType.error;
        _errorText = "Please Enter OTP";
        notifyListeners();
      }
    } catch (e) {
      _snackbarType = SnackbarType.error;
      _errorText = e.toString();
      notifyListeners();
    } finally {
      setLoading(false); // Stop loading
    }
  }

  void navToLogin() {
    _navigationService.navigateTo(Routes.registerView);
  }

  Future<void> _handleUserCreation({User? user, String? email}) async {
    bool allOkay = await findUser(id: user?.id ?? "");
    if (allOkay) {
      // User already exists
      _navigationService.clearStackAndShow(Routes.navbarView);
      await CacheManager.setString(
        key: CacheKeys.userLoggedInKey,
        value: user?.id ?? "error",
      );
      return;
    } else {
      // User does not exist
      String username = email!.split('@')[0];
      Users newUsers = Users(
        profileUrl: "https://api.multiavatar.com/$email.png",
        userId: user?.id ?? "",
        userName: username,
        email: email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        animalSprit: null,
      );

      await _userDBService.createUser(
        user: newUsers,
      );
      _userService.setUser(user: newUsers);

      await CacheManager.setString(
        key: CacheKeys.userLoggedInKey,
        value: user?.id ?? "error",
      );

      _navigationService.clearStackAndShow(Routes.navbarView);
    }
  }

  Future<bool> findUser({required String id}) async {
    try {
      Users? user = await _userDBService.getUser(userId: id);
      if (user == null) {
        return false;
      } else {
        _userService.setUser(user: user);
        return true;
      }
    } catch (e) {
      _snackbarType = SnackbarType.error;
      _errorText = e.toString();
      notifyListeners();
    }
    return false;
  }
}
