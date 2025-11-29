import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';

class NavbarViewModel extends IndexTrackingViewModel {
  List<CrystalNavigationBarItem> bottomNavItems = [
    CrystalNavigationBarItem(
      icon: IconlyBold.home,
      unselectedIcon: IconlyLight.home,
      selectedColor: AppColors.iceBlue,
    ),
    // CrystalNavigationBarItem(
    //   icon: IconlyBold.activity,
    //   unselectedIcon: IconlyLight.activity,
    //   selectedColor: AppColors.iceBlue,
    // ),
    CrystalNavigationBarItem(
      icon: IconlyBold.graph,
      unselectedIcon: IconlyLight.graph,
      selectedColor: AppColors.iceBlue,
    ),
    CrystalNavigationBarItem(
      icon: IconlyBold.setting,
      unselectedIcon: IconlyLight.setting,
      selectedColor: AppColors.iceBlue,
    ),
  ];
}
