import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/register/widget/loading.dialog.dart';
import 'package:streakit/ui/widget/custom_button.dart';
import 'package:streakit/ui/widget/custom_snackbar.dart';
import 'package:streakit/z_animated_emoji/streak_animated_emoji.dart';

import 'otp_viewmodel.dart';

class OtpView extends StackedView<OtpViewModel> {
  final String email;
  const OtpView({required this.email, super.key});

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
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
                                  "OTP Verification",
                                  style: AppTextStyles.displayMedium,
                                ),
                                HorizontalSpaceBox.s5,
                                const AnimatedEmoji(
                                  AnimatedEmojis.collision,
                                  size: 34,
                                  repeat: true,
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s2,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Enter the OTP sent to",
                                  style: AppTextStyles.bodyText2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      email,
                                      style: AppTextStyles.bodyText2.copyWith(
                                        color: AppColors.iceBlue,
                                      ),
                                    ),
                                    HorizontalSpaceBox.s5,
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.navToLogin();
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColors.iceBlue,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s40,
                            OtpTextField(
                              numberOfFields: 6,
                              fieldWidth: 50,
                              borderColor: AppColors.indianRed,
                              focusedBorderColor: AppColors.greenish,
                              showFieldAsBox: false,
                              borderWidth: 4.0,
                              onSubmit: (String verificationCode) {
                                viewModel.token = verificationCode;
                              },
                            ),
                            VerticalSpaceBox.s16,
                          ],
                        ),
                        CustomSnackbar(
                          isVisible: viewModel.errorText != null,
                          onClose: () {
                            viewModel.clearError();
                          },
                          message: viewModel.errorText ?? " ",
                          type: viewModel.snackbarType,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        CustomButton(
                          buttonName: "Submit",
                          bgColor: AppColors.creamColor,
                          textColor: AppColors.blackColor,
                          onTap: () async {
                            await viewModel.signUser();
                          },
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
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel(
        email: email,
      );
}
