import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent background
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        // Dialog
        Center(
          child: AlertDialog(
            backgroundColor: AppColors.blackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Animated loading spinner
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.creamColor),
                  ),
                  VerticalSpaceBox.s16,
                  // Title
                  Text(
                    'Please wait...',
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: AppColors.creamColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  VerticalSpaceBox.s8,
                  // Subtitle
                  Text(
                    'We are processing your request',
                    style: AppTextStyles.bodyText2.copyWith(
                      color: AppColors.greyish,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
