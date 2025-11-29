import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:streakit/ui/widget/custom_button.dart';
import 'package:streakit/ui/widget/custom_snackbar.dart';
import 'package:streakit/ui/widget/custom_text_field.dart';

import 'change_password_viewmodel.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        iconData: IconlyLight.arrowLeft2,
        iconColor: AppColors.iceBlue,
        onPressed: () {
          viewModel.goBack();
        },
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpaceBox.s16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Change Password",
                          style: AppTextStyles.displayMedium,
                        ),
                        HorizontalSpaceBox.s5,
                      ],
                    ),
                    VerticalSpaceBox.s2,
                    Text(
                      "Note: You'll be logged out after changing your password",
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.greyish,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpaceBox.s60,
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: viewModel.formKey,
                      child: Column(
                        children: [
                          CustomTextField.customTextField(
                            textEditingController:
                                viewModel.newPasswordController,
                            hintText: "Enter Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              }
                              return null;
                            },
                          ),
                          VerticalSpaceBox.s16,
                          CustomTextField.customTextField(
                            textEditingController:
                                viewModel.confirmPasswordController,
                            hintText: "Enter Confirm Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Confirmed Password cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    VerticalSpaceBox.s16,
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
                    VerticalSpaceBox.s16,
                    CustomButton(
                      buttonName: "Change Password",
                      bgColor: AppColors.creamColor,
                      textColor: AppColors.blackColor,
                      onTap: () async {
                        await viewModel.changePassword(context: context);
                      },
                    ),
                    VerticalSpaceBox.s16,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
