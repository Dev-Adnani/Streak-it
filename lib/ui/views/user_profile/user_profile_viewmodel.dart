import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/brick/models/users.model.dart';
import 'package:streakit/repository/user_repository.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/z_animated_emoji/animated.animals.dart';
import 'package:streakit/z_animated_emoji/lottie_assets.dart';

class UserProfileViewModel extends BaseViewModel {
  final TextEditingController userNameController = TextEditingController();
  final UserDBRepository _userDBRepository = UserDBRepository();
  final UserService _userService = locator<UserService>();
  final ScrollController scrollController = ScrollController();
  final NavigationService _navigationService = locator<NavigationService>();
  Users? user;

  late String userAnimalSpirit, userAnimalDescription, profileUrl;

  void changeProfileUrl(String newUserName) {
    profileUrl =
        "https://api.multiavatar.com/$userAnimalSpirit$newUserName.png";
    notifyListeners();
  }

  // Form
  Key formKey = GlobalKey<FormState>();

  String? _errorText;
  String? get errorText => _errorText;
  UserProfileViewModel() {
    user = _userService.getUser();
    userNameController.text = user?.userName ?? "User Name";
    userAnimalSpirit = user?.animalSprit ?? AnimatedEmojis.whale;
    profileUrl = user?.profileUrl ?? "https://api.multiavatar.com/dev6.png";

    // Find the index of the selected animal spirit
    int selectedAnimalIndex =
        animalsSpirts.indexWhere((spirit) => spirit.emoji == userAnimalSpirit);

    // Set the animal description
    userAnimalDescription = getAnimalDescription(userAnimalSpirit);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedAnimalIndex != -1) {
        scrollController.jumpTo(selectedAnimalIndex * 90.0);
      }
    });
  }

  void goBack() {
    _navigationService.back();
  }

  void selectAnimalSpirit(String spirit, String description) {
    userAnimalSpirit = spirit;
    userAnimalDescription = description;
    changeProfileUrl(userNameController.text);
    notifyListeners();
  }

  Future<void> updateAccountStatus() async {
    String data =
        await _userDBRepository.changePlanStatus(userId: user?.userId ?? "");
    _errorText = data;
    notifyListeners();
  }

  Future<void> updateUserProfile() async {
    setBusy(true);
    try {
      // Save updated data
      Users? updatedUser = user?.copyWith(
        userName: userNameController.text,
        updatedAt: DateTime.now(),
        animalSprit: userAnimalSpirit,
        profileUrl: profileUrl,
      );

      if (updatedUser != null) {
        await _userDBRepository.updateUser(user: updatedUser);
        _userService.setUser(user: updatedUser);
        _errorText = "User profile updated successfully";
      } else {
        _errorText = "Failed to update user profile";
      }

      notifyListeners();
    } catch (e) {
      _errorText = "Failed to update user profile";
      notifyListeners();
    }
    setBusy(false);
  }

  void clearError() {
    _errorText = null;
    notifyListeners();
  }

  @override
  void dispose() {
    userNameController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
