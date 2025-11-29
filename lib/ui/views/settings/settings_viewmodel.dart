import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/local/cache_manager.dart';
import 'package:streakit/repository/habit_repository.dart';
import 'package:streakit/services/google_auth_service.dart';
import 'package:streakit/services/notification_service.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/ui/views/register/widget/loading.dialog.dart';
import 'package:streakit/ui/views/settings/widget/delete.account.dialog.dart';
import 'package:streakit/ui/views/settings/widget/logout.dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SupabaseClient _client =
      locator<SupabaseApiService>().supabaseInstance.client;
  final GoogleAuthService _googleAuthService = locator<GoogleAuthService>();
  final UserService _userService = locator<UserService>();
  final HabitRepository _repository = HabitRepository();

  String? _successText;
  String? get successText => _successText;

  String? _warningText;
  String? get warningText => _warningText;

  void clearError() {
    _successText = null;
    _warningText = null;
    notifyListeners();
  }

  void showLogoutDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutAccountDialog(
          onConfirm: () {
            Navigator.of(context).pop(); // Close dialog
            logout();
          },
          onCancel: () {
            Navigator.of(context).pop(); // Close dialog
          },
        );
      },
    );
  }

  void changePlan() {
    _warningText =
        "For Now Users are on Freemium Plan, All Plans will be available soon";
    notifyListeners();
  }

  void showDeleteAccountDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteAccountDialog(
          onConfirm: () {
            Navigator.of(context).pop(); // Close dialog
            // Add account deletion logic here
          },
          onCancel: () {
            Navigator.of(context).pop(); // Close dialog
          },
        );
      },
    );
  }

  Future<void> logout() async {
    try {
      await CacheManager.deleteKey(key: CacheKeys.userLoggedInKey);
      _userService.clearUser();
      await _googleAuthService.googleSignIn?.signOut();
      await _client.auth.signOut();
      await _navigationService.clearStackAndShow(Routes.registerView);
    } catch (e) {
      rethrow;
    }
  }

  void navigateToProfile() {
    _navigationService.navigateToUserProfileView();
  }

  Future<void> openUrl(Uri uri) async {
    try {
      log("Trying to open URL: $uri");
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        log("Cannot launch URL: $uri");
      }
    } catch (e) {
      log("Error launching URL: $uri, Error: $e");
    }
  }

  void syncNotification({required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog();
        });
    // Get All Habits
    List<Habit> habits = await _repository.getFHabitsByUserIdNotArchived(
      userId: _userService.getUser()?.userId ?? "userId",
    );
    final NotificationService notificationService =
        locator<NotificationService>();
    for (var habit in habits) {
      notificationService.scheduleHabitReminders(habit);
    }
    _successText = "Notification Synced";
    notifyListeners();

    Navigator.of(context).pop();
  }

  void openSite() async {
    final Uri siteUri = Uri.parse("http://streak.selfscape.club/");
    await openUrl(siteUri);
  }

  void openPrivacyPolicy() async {
    final Uri privacyUri = Uri.parse("http://streak.selfscape.club/privacy/");
    await openUrl(privacyUri);
  }

  void openTerms() async {
    final Uri termsUri = Uri.parse("http://streak.selfscape.club/terms/");
    await openUrl(termsUri);
  }

  void upcomingFeaturesView() {
    _navigationService.navigateToUpcomingFeaturesView();
  }

  void archievedHabitView() {
    _navigationService.navigateToArchivedHabitView();
  }

  void suppprtDevloperView() {
    _navigationService.navigateToSupportDeveloperView();
  }

  Future<String> getDeviceInfo({required String userId}) async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String deviceInfo = '';
    String osVersion = '';
    String appVersion = packageInfo.version;

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceInfo = androidInfo.model;
      osVersion = "Android ${androidInfo.version.release}";
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceInfo = iosInfo.utsname.machine;
      osVersion = "iOS ${iosInfo.systemVersion}";
    }

    return "Device: $deviceInfo\nOS: $osVersion\nApp Version: $appVersion\nUser ID: $userId";
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> sendFeedback() async {
    final String userId = _userService.getUser()?.userId ?? "userId";
    String deviceInfo = await getDeviceInfo(userId: userId);

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'streak@selfscape.com',
      query: encodeQueryParameters({
        'subject': 'Streak Scape Feedback',
        'body': deviceInfo,
      }),
    );

    try {
      log("Trying to open URL: $emailLaunchUri");
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
      } else {
        log("Cannot launch URL: $emailLaunchUri");
      }
    } catch (e) {
      log("Error launching URL: $emailLaunchUri, Error: $e");
    }
  }
}
