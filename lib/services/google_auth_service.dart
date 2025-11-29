import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/brick/models/users.model.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/repository/user_repository.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/local/cache_manager.dart';
import 'package:streakit/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';

class GoogleAuthService {
  final SupabaseClient _client =
      locator<SupabaseApiService>().supabaseInstance.client;
  final UserDBRepository _userDBService = UserDBRepository();
  final NavigationService _navigationService = locator<NavigationService>();
  GoogleSignIn? googleSignIn;
  final UserService _userService = locator<UserService>();

  Future<void> signInWithGoogle() async {
    const webClientId =
        '63330154236-s7pc8cscqf99q6i22kd89srj0iltp0qr.apps.googleusercontent.com';
    const iosClientId =
        '63330154236-ek9b3i0oka7paoq7bokau3kmic2m3m89.apps.googleusercontent.com';

    googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    try {
      final googleUser = await googleSignIn?.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      // Sign in to Supabase
      final AuthResponse response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken!,
      );

      if (response.user != null) {
        await _handleUserAfterLogin(
          userId: response.user!.id,
          userName: googleUser.displayName,
          email: googleUser.email,
        );
      }
    } catch (e) {
      log("Error signing in with Google: $e");
    }
  }

  Future<void> _handleUserAfterLogin(
      {required String userId,
      required String? userName,
      required String? email}) async {
    Users? user = await _userDBService.getUser(userId: userId);

    if (user != null) {
      // User exists, save data and navigate
      _userService.setUser(user: user);
      await CacheManager.setString(
          key: CacheKeys.userLoggedInKey, value: userId);
      _navigationService.clearStackAndShow(Routes.navbarView);
    } else {
      // User does not exist, create a new user
      await _createUser(userId: userId, userName: userName, email: email);
    }
  }

  Future<void> _createUser(
      {required String userId,
      required String? userName,
      required String? email}) async {
    final Users newUser = Users(
      profileUrl: "https://api.multiavatar.com/$userName.png",
      userId: userId,
      userName: userName ?? "",
      email: email ?? "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      animalSprit: null,
    );

    _userService.setUser(user: newUser);
    await _userDBService.createUser(user: newUser);
    await CacheManager.setString(key: CacheKeys.userLoggedInKey, value: userId);
    _navigationService.clearStackAndShow(Routes.navbarView);
  }
}
