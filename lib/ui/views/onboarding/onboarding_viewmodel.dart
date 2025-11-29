import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToSignUp() {
    _navigationService.navigateToRegisterView();
  }
}
