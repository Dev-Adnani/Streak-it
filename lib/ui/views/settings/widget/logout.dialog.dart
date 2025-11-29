import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class LogoutAccountDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const LogoutAccountDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              'Logout ?',
              style: AppTextStyles.headlineMedium,
              textAlign: TextAlign.center,
            ),
            VerticalSpaceBox.s16,
            Text(
              "Are you sure you want to logout?",
              style:
                  AppTextStyles.bodyText3.copyWith(color: AppColors.creamColor),
              textAlign: TextAlign.justify,
            ),
            VerticalSpaceBox.s24,

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onCancel,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
                HorizontalSpaceBox.s12,
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.indianRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Proceed'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
