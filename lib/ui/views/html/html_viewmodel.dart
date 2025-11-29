import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';

class HtmlViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void popScreen() {
    _navigationService.back();
  }
}
