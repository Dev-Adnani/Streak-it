import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:streakit/ui/widget/custom_button.dart';
import 'package:streakit/ui/widget/custom_text_field.dart';
import 'package:streakit/z_animated_emoji/animated.animals.dart';
import 'package:streakit/z_animated_emoji/streak_animated_emoji.dart';
import 'package:toasty_box/toast_service.dart';
import 'user_profile_viewmodel.dart';

class UserProfileView extends StackedView<UserProfileViewModel> {
  const UserProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserProfileViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.errorText != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ToastService.showErrorToast(
          context,
          message: viewModel.errorText ?? " ",
        );
        viewModel.clearError();
      });
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        iconData: IconlyLight.arrowLeft,
        iconColor: AppColors.creamColor,
        onPressed: () {
          viewModel.goBack();
        },
        title: "Profile",
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          AppColors.creamColor.withValues(alpha: 0.1),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.creamColor,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                viewModel.profileUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpaceBox.s16,
                    Text(
                      " Note : Your Profile Picture is a combination of your username and animal spirit",
                      style: AppTextStyles.bodyText4.copyWith(
                        color: AppColors.greenish,
                        backgroundColor:
                            AppColors.creamColor.withValues(alpha: 0.010),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpaceBox.s32,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Edit Information",
                        style: AppTextStyles.bodyText2,
                      ),
                    ),
                    VerticalSpaceBox.s16,
                    Form(
                      // key: viewModel.formKey,
                      child: CustomTextField.customTextField(
                        textEditingController: viewModel.userNameController,
                        hintText: "Enter Username",
                        onChanged: (str) {
                          viewModel.changeProfileUrl(str);
                        },
                      ),
                    ),
                    VerticalSpaceBox.s16,
                    // Update Button
                  ],
                ),
              ),
            ),
            // Refined Animal Spirit Slider with Descriptions
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    Text(
                      "Choose Your Animal Spirit",
                      style: AppTextStyles.bodyText1.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.creamColor,
                      ),
                    ),
                    VerticalSpaceBox.s24,

                    // Emoji Slider
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        controller: viewModel.scrollController,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => HorizontalSpaceBox.s16,
                        itemCount: animalsSpirts.length,
                        itemBuilder: (context, index) {
                          final spirit = animalsSpirts[index];
                          final isSelected =
                              spirit.emoji == viewModel.userAnimalSpirit;
                          return GestureDetector(
                            onTap: () {
                              viewModel.selectAnimalSpirit(
                                spirit.emoji,
                                spirit.description,
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              width: isSelected ? 90 : 80,
                              height: isSelected ? 90 : 80,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.greenish.withValues(alpha: 0.15)
                                    : AppColors.creamColor
                                        .withValues(alpha: 0.05),
                                shape: BoxShape.circle,
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: AppColors.greenish
                                              .withValues(alpha: 0.4),
                                          blurRadius: 15,
                                          spreadRadius: 1,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Center(
                                child: AnimatedEmoji(
                                  spirit.emoji,
                                  size: isSelected ? 60 : 50,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    VerticalSpaceBox.s24,
                    // Description with Animation
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.2),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
                      child: Text(
                        viewModel.userAnimalDescription,
                        key: ValueKey<String>(viewModel.userAnimalDescription),
                        style: AppTextStyles.bodyText2.copyWith(
                          color: AppColors.creamColor,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                    VerticalSpaceBox.s16,
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      buttonName: "Save Changes",
                      bgColor: AppColors.greenish,
                      textColor: AppColors.blackColor,
                      onTap: () async {
                        await viewModel.updateUserProfile();
                      },
                    ),
                    VerticalSpaceBox.s32,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  UserProfileViewModel viewModelBuilder(BuildContext context) =>
      UserProfileViewModel();
}
