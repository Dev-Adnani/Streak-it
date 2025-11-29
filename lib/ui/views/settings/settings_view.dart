import 'package:streakit/z_animated_emoji/streak_animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/settings/widget/settings.section.dart';
import 'package:streakit/ui/views/settings/widget/settings.tile.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:toasty_box/toast_service.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.successText != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ToastService.showSuccessToast(
            context,
            message: viewModel.successText ?? " ",
          );
          viewModel.clearError();
        },
      );
    }

    if (viewModel.warningText != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ToastService.showWarningToast(
            context,
            message: viewModel.warningText ?? " ",
          );
          viewModel.clearError();
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        title: "Settings",
        iconData: IconlyLight.setting,
        iconColor: AppColors.iceBlue,
        children: [
          IconButton(
            icon: const Icon(IconlyLight.logout, color: AppColors.iceBlue),
            onPressed: () {
              viewModel.showLogoutDialog(context: context);
            },
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.darkOliveGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.volunteer_activism_outlined,
                      color: AppColors.creamColor,
                    ),
                    HorizontalSpaceBox.s12,
                    Expanded(
                      child: Text(
                        "Support the developer by donating",
                        style: TextStyle(
                          color: AppColors.creamColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    HorizontalSpaceBox.s12,
                    ElevatedButton(
                      onPressed: () {
                        viewModel.suppprtDevloperView();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.creamColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Donate",
                        style: TextStyle(
                          color: AppColors.darkOliveGreen,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SettingsSection(
                name: "Account",
                children: [
                  SettingsTile(
                    name: "Profile",
                    iconData: Icons.person_outline,
                    iconBackgroundColor: AppColors.darkOliveGreen,
                    onTap: () {
                      viewModel.navigateToProfile();
                    },
                  ),
                  // Change Plan / Go Premium
                  SettingsTile(
                    name: "Change Plan",
                    iconData: Icons.card_giftcard_outlined,
                    iconBackgroundColor: AppColors.slateBlue,
                    onTap: () {
                      viewModel.changePlan();
                    },
                  ),
                  SettingsTile(
                    name: "Delete Account",
                    iconData: Icons.delete_outline,
                    iconBackgroundColor: AppColors.burntSienna,
                    onTap: () {
                      viewModel.showDeleteAccountDialog(context: context);
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SettingsSection(
                name: "App",
                children: [
                  SettingsTile(
                    name: "Archived Habits",
                    iconData: Icons.archive,
                    iconBackgroundColor: AppColors.slateBlue,
                    onTap: () {
                      viewModel.archievedHabitView();
                    },
                  ),
                  SettingsTile(
                    name: "Sync Notifications",
                    iconData: Icons.notifications_none_outlined,
                    iconBackgroundColor: AppColors.lightRed,
                    onTap: () {
                      viewModel.syncNotification(context: context);
                    },
                  ),
                  SettingsTile(
                    name: "New Features & Updates",
                    iconData: Icons.update_rounded,
                    iconBackgroundColor: AppColors.darkOliveGreen,
                    onTap: () {
                      viewModel.upcomingFeaturesView();
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SettingsSection(
                name: "General",
                children: [
                  SettingsTile(
                    name: "Website",
                    iconData: Icons.language_outlined,
                    iconBackgroundColor: AppColors.forestGreen,
                    onTap: () {
                      viewModel.openSite();
                    },
                  ),
                  SettingsTile(
                    name: "Privacy Policy",
                    iconData: Icons.privacy_tip_outlined,
                    iconBackgroundColor: AppColors.coral,
                    onTap: () {
                      viewModel.openPrivacyPolicy();
                    },
                  ),
                  SettingsTile(
                    name: "Terms of Service",
                    iconData: Icons.rule_outlined,
                    iconBackgroundColor: AppColors.burntSienna,
                    onTap: () {
                      viewModel.openTerms();
                    },
                  ),
                  SettingsTile(
                    name: "Send Feedback",
                    iconData: Icons.feedback_outlined,
                    iconBackgroundColor: AppColors.plum,
                    onTap: () async {
                      await viewModel.sendFeedback();
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Text("Streakit v1.0.0",
                      style: TextStyle(color: AppColors.creamColor)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Made with ",
                          style: TextStyle(color: AppColors.creamColor)),
                      const AnimatedEmoji(
                        AnimatedEmojis.heartFace,
                        size: 20,
                        repeat: true,
                      ),
                      HorizontalSpaceBox.s5,
                      const AnimatedEmoji(
                        AnimatedEmojis.hotBeverage,
                        size: 20,
                        repeat: true,
                      ),
                      const Text(" by @Dev Adnani ",
                          style: TextStyle(color: AppColors.creamColor)),
                    ],
                  ),
                  VerticalSpaceBox.s60,
                  VerticalSpaceBox.s60,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
