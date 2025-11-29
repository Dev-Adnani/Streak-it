import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';

import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class PopupHabit extends StatelessWidget {
  final bool showCalender;
  final VoidCallback onArchiveTap, onEditTap;
  final VoidCallback? onCalenderTap;
  const PopupHabit({
    super.key,
    required this.onEditTap,
    required this.onArchiveTap,
    this.showCalender = false,
    this.onCalenderTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      showArrow: false,
      backgroundColor: AppColors.blackColor,
      content: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPopupOption(
              context,
              icon: Icons.archive_rounded,
              label: "Archive Habit",
              color: AppColors.iceBlue,
              onTap: () {
                onArchiveTap();
                Navigator.of(context).pop();
              },
            ),
            _buildPopupOption(
              context,
              icon: Icons.edit_rounded,
              color: AppColors.greenish,
              label: "Edit Habit",
              onTap: () {
                onEditTap();
              },
            ),
            if (showCalender)
              _buildPopupOption(context,
                  icon: Icons.calendar_today_rounded,
                  label: "Calendar",
                  color: AppColors.yellowish, onTap: () {
                if (onCalenderTap != null) {
                  onCalenderTap!();
                }
              }),
          ],
        ),
      ),
      child: const Icon(
        Icons.more_vert_rounded,
        color: AppColors.creamColor,
        size: 30,
      ),
    );
  }

  Widget _buildPopupOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            HorizontalSpaceBox.s8,
            Text(
              label,
              style: AppTextStyles.bodyText2.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
