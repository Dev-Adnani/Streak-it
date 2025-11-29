import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class DeleteHabitDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const DeleteHabitDialog({
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
              'Delete Habit ?',
              style: AppTextStyles.headlineMedium,
              textAlign: TextAlign.center,
            ),
            VerticalSpaceBox.s16,
            // Warning Box
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: 24,
                  ),
                  HorizontalSpaceBox.s12,
                  Expanded(
                    child: Text(
                      'This action will delete your habit and all habit completion data.',
                      style: AppTextStyles.bodyText3.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpaceBox.s16,
            Text(
              'This action cannot be undone. Are you sure you want to proceed?',
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
