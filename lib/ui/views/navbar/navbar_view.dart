import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/views/analytics/analytics_view.dart';
import 'package:streakit/ui/views/home/home_view.dart';
import 'package:streakit/ui/views/settings/settings_view.dart';
import 'navbar_viewmodel.dart';

class NavbarView extends StackedView<NavbarViewModel> {
  const NavbarView({super.key});

  @override
  Widget builder(
    BuildContext context,
    NavbarViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.blackColor,
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: const [
          HomeView(),
          AnalyticsView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: viewModel.currentIndex,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        items: viewModel.bottomNavItems,
        onTap: viewModel.setIndex,
      ),
    );
  }

  @override
  NavbarViewModel viewModelBuilder(BuildContext context) => NavbarViewModel();
}
