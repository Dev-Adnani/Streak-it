// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;
import 'package:streakit/brick/models/habit.model.dart' as _i17;
import 'package:streakit/ui/views/archived_habit/archived_habit_view.dart'
    as _i15;
import 'package:streakit/ui/views/change_password/change_password_view.dart'
    as _i9;
import 'package:streakit/ui/views/create_habit/create_habit_view.dart' as _i11;
import 'package:streakit/ui/views/home/home_view.dart' as _i2;
import 'package:streakit/ui/views/html/html_view.dart' as _i3;
import 'package:streakit/ui/views/navbar/navbar_view.dart' as _i10;
import 'package:streakit/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:streakit/ui/views/otp/otp_view.dart' as _i6;
import 'package:streakit/ui/views/register/register_view.dart' as _i5;
import 'package:streakit/ui/views/settings/settings_view.dart' as _i7;
import 'package:streakit/ui/views/splash/splash_view.dart' as _i8;
import 'package:streakit/ui/views/support_developer/support_developer_view.dart'
    as _i13;
import 'package:streakit/ui/views/upcoming_features/upcoming_features_view.dart'
    as _i12;
import 'package:streakit/ui/views/user_profile/user_profile_view.dart' as _i14;

class Routes {
  static const homeView = '/home-view';

  static const htmlView = '/html-view';

  static const onboardingView = '/onboarding-view';

  static const registerView = '/register-view';

  static const otpView = '/otp-view';

  static const settingsView = '/settings-view';

  static const splashView = '/splash-view';

  static const changePasswordView = '/change-password-view';

  static const navbarView = '/navbar-view';

  static const createHabitView = '/create-habit-view';

  static const upcomingFeaturesView = '/upcoming-features-view';

  static const supportDeveloperView = '/support-developer-view';

  static const userProfileView = '/user-profile-view';

  static const archivedHabitView = '/archived-habit-view';

  static const all = <String>{
    homeView,
    htmlView,
    onboardingView,
    registerView,
    otpView,
    settingsView,
    splashView,
    changePasswordView,
    navbarView,
    createHabitView,
    upcomingFeaturesView,
    supportDeveloperView,
    userProfileView,
    archivedHabitView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.htmlView,
      page: _i3.HtmlView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i5.RegisterView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i6.OtpView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i7.SettingsView,
    ),
    _i1.RouteDef(
      Routes.splashView,
      page: _i8.SplashView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i9.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.navbarView,
      page: _i10.NavbarView,
    ),
    _i1.RouteDef(
      Routes.createHabitView,
      page: _i11.CreateHabitView,
    ),
    _i1.RouteDef(
      Routes.upcomingFeaturesView,
      page: _i12.UpcomingFeaturesView,
    ),
    _i1.RouteDef(
      Routes.supportDeveloperView,
      page: _i13.SupportDeveloperView,
    ),
    _i1.RouteDef(
      Routes.userProfileView,
      page: _i14.UserProfileView,
    ),
    _i1.RouteDef(
      Routes.archivedHabitView,
      page: _i15.ArchivedHabitView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.HtmlView: (data) {
      final args = data.getArgs<HtmlViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.HtmlView(params: args.params, key: args.key),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.RegisterView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterView(),
        settings: data,
      );
    },
    _i6.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.OtpView(email: args.email, key: args.key),
        settings: data,
      );
    },
    _i7.SettingsView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SettingsView(),
        settings: data,
      );
    },
    _i8.SplashView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SplashView(),
        settings: data,
      );
    },
    _i9.ChangePasswordView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ChangePasswordView(),
        settings: data,
      );
    },
    _i10.NavbarView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.NavbarView(),
        settings: data,
      );
    },
    _i11.CreateHabitView: (data) {
      final args = data.getArgs<CreateHabitViewArguments>(
        orElse: () => const CreateHabitViewArguments(),
      );
      return _i16.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i11.CreateHabitView(key: args.key, habit: args.habit),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i12.UpcomingFeaturesView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.UpcomingFeaturesView(),
        settings: data,
      );
    },
    _i13.SupportDeveloperView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.SupportDeveloperView(),
        settings: data,
      );
    },
    _i14.UserProfileView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.UserProfileView(),
        settings: data,
      );
    },
    _i15.ArchivedHabitView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ArchivedHabitView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HtmlViewArguments {
  const HtmlViewArguments({
    required this.params,
    this.key,
  });

  final _i3.HtmlScreenParams params;

  final _i16.Key? key;

  @override
  String toString() {
    return '{"params": "$params", "key": "$key"}';
  }

  @override
  bool operator ==(covariant HtmlViewArguments other) {
    if (identical(this, other)) return true;
    return other.params == params && other.key == key;
  }

  @override
  int get hashCode {
    return params.hashCode ^ key.hashCode;
  }
}

class OtpViewArguments {
  const OtpViewArguments({
    required this.email,
    this.key,
  });

  final String email;

  final _i16.Key? key;

  @override
  String toString() {
    return '{"email": "$email", "key": "$key"}';
  }

  @override
  bool operator ==(covariant OtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.email == email && other.key == key;
  }

  @override
  int get hashCode {
    return email.hashCode ^ key.hashCode;
  }
}

class CreateHabitViewArguments {
  const CreateHabitViewArguments({
    this.key,
    this.habit,
  });

  final _i16.Key? key;

  final _i17.Habit? habit;

  @override
  String toString() {
    return '{"key": "$key", "habit": "$habit"}';
  }

  @override
  bool operator ==(covariant CreateHabitViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.habit == habit;
  }

  @override
  int get hashCode {
    return key.hashCode ^ habit.hashCode;
  }
}

extension NavigatorStateExtension on _i18.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHtmlView({
    required _i3.HtmlScreenParams params,
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.htmlView,
        arguments: HtmlViewArguments(params: params, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView({
    required String email,
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(email: email, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNavbarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.navbarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateHabitView({
    _i16.Key? key,
    _i17.Habit? habit,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createHabitView,
        arguments: CreateHabitViewArguments(key: key, habit: habit),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpcomingFeaturesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.upcomingFeaturesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSupportDeveloperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.supportDeveloperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToArchivedHabitView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.archivedHabitView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHtmlView({
    required _i3.HtmlScreenParams params,
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.htmlView,
        arguments: HtmlViewArguments(params: params, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    required String email,
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(email: email, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNavbarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.navbarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateHabitView({
    _i16.Key? key,
    _i17.Habit? habit,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createHabitView,
        arguments: CreateHabitViewArguments(key: key, habit: habit),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpcomingFeaturesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.upcomingFeaturesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSupportDeveloperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.supportDeveloperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithArchivedHabitView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.archivedHabitView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
