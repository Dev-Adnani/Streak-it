import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streakit/ui/common/app.assets.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class CustomHabitArchiveView extends StatelessWidget {
  final String habitName;
  final String? habitDescription;
  final String? icon;
  final VoidCallback onUnarchiveTap;
  final VoidCallback onDeleteTap;

  const CustomHabitArchiveView({
    super.key,
    required this.habitName,
    this.habitDescription,
    this.icon,
    required this.onUnarchiveTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Habit Icon
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.iceBlue.withValues(alpha: 0.1),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon ?? AppIconPack.ASSETS_ICON_PACK_ARCHIVE_SVG,
                colorFilter:
                    ColorFilter.mode(AppColors.iceBlue, BlendMode.srcIn),
                height: 20,
              ),
            ),
          ),
          HorizontalSpaceBox.s16,
          // Habit Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habitName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (habitDescription != null)
                  Text(
                    habitDescription!,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
          HorizontalSpaceBox.s16,
          // Unarchive Button
          TextButton(
            onPressed: onUnarchiveTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              backgroundColor: AppColors.iceBlue.withValues(alpha: 0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Unarchive",
              style: TextStyle(
                color: AppColors.iceBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          HorizontalSpaceBox.s8,
          TextButton(
            onPressed: onDeleteTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              backgroundColor: AppColors.indianRed.withValues(alpha: 0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Delete",
              style: TextStyle(
                color: AppColors.indianRed,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
