import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/views/register/widget/loading.dialog.dart';
import 'package:streakit/z_animated_emoji/streak_animated_emoji.dart';
import 'package:streakit/ui/common/app.assets.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/widget/custom_button.dart';
import 'package:streakit/ui/widget/custom_text_field.dart';
import 'package:toasty_box/toast_service.dart';

import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
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

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SafeArea(
            child: CustomScrollView(
              reverse: true,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        VerticalSpaceBox.s50,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome ",
                                  style: AppTextStyles.displayMedium,
                                ),
                                HorizontalSpaceBox.s5,
                                const AnimatedEmoji(
                                  AnimatedEmojis.blush,
                                  size: 34,
                                  repeat: true,
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s2,
                            Text.rich(
                              TextSpan(
                                text: "Let us help you get started",
                                style: AppTextStyles.bodyText2,
                                children: [
                                  TextSpan(
                                    text: "\n with your streak journey",
                                    style: AppTextStyles.bodyText2.copyWith(
                                      color: AppColors.greenish,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            VerticalSpaceBox.s40,
                            Form(
                              key: viewModel.signUpFormKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  CustomTextField.customTextField(
                                    textEditingController:
                                        viewModel.emailController,
                                    hintText: "Enter Email",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            VerticalSpaceBox.s16,
                            CustomButton(
                              buttonName: "Let's Go",
                              bgColor: AppColors.creamColor,
                              textColor: AppColors.blackColor,
                              onTap: () async {
                                await viewModel.signUp();
                              },
                            ),
                            VerticalSpaceBox.s16,
                            Row(
                              children: [
                                const Flexible(
                                  child: Divider(
                                    thickness: 1,
                                    color: AppColors.greyish,
                                  ),
                                ),
                                Text(
                                  "    OR    ",
                                  style: AppTextStyles.bodyText2.copyWith(
                                    color: AppColors.greyish,
                                  ),
                                ),
                                const Flexible(
                                  child: Divider(
                                    thickness: 1,
                                    color: AppColors.greyish,
                                  ),
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s16,
                            GestureDetector(
                              onTap: () {
                                viewModel.signUpWithGoogle();
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.creamColor,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.svgIcons8Google,
                                      height: 40,
                                      width: 40,
                                    ),
                                    HorizontalSpaceBox.s8,
                                    Text(
                                      " Sign In With Google",
                                      style: AppTextStyles.bodyText2.copyWith(
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalSpaceBox.s16,
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (viewModel.isLoading)
          Center(
            child: const LoadingDialog(), // Show the LoadingDialog
          ),
      ],
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
