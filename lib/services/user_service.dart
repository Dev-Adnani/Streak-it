import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/brick/models/users.model.dart';

class UserService {
  Users? _user;
  final NavigationService _navigationService = locator<NavigationService>();

  void setUser({required Users user}) {
    _user = user;
  }

  Users? getUser() {
    if (_user == null) {
      _navigationService.clearTillFirstAndShow(Routes.registerView);
    } else {
      return _user;
    }
    return null;
  }

  void clearUser() {
    _user = null;
  }
}
