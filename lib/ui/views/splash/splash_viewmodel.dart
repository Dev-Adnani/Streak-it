import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/local/cache_manager.dart';
import 'package:streakit/brick/models/users.model.dart';
import 'package:streakit/repository/user_repository.dart';
import 'package:streakit/services/user_service.dart';

class SplashViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final UserDBRepository _userDBService = UserDBRepository();

  void selectView() {
    CacheManager.conditionalCache(
      key: CacheKeys.onBoardingKey,
      valueType: ValueType.boolValue,
      actionIfNull: () {
        _navigationService.navigateToOnboardingView();
      },
      actionIfNotNull: () async {
        String? userLoggedIn =
            await CacheManager.getString(key: CacheKeys.userLoggedInKey);
        if (userLoggedIn == "error" || userLoggedIn == null) {
          _navigationService.clearStackAndShow(Routes.registerView);
        } else {
          log("User Logged In: $userLoggedIn");
          Users? user = await _userDBService.getUser(userId: userLoggedIn);
          if (user != null) {
            _userService.setUser(user: user);
            _navigationService.clearStackAndShow(Routes.navbarView);
          } else {
            _navigationService.clearStackAndShow(Routes.registerView);
          }
        }
      },
    );
  }

  @override
  Future initialise() async {
    await Future.delayed(const Duration(seconds: 2));
    selectView();
  }

  @override
  Future futureToRun() {
    return Future.value();
  }
}
