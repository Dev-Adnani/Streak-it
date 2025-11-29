import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class SettingsTile extends StatelessWidget {
  final String name;
  final IconData iconData;
  final Function()? onTap;
  final Color iconBackgroundColor;
  const SettingsTile(
      {super.key,
      required this.name,
      required this.iconData,
      this.onTap,
      required this.iconBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: iconBackgroundColor.withValues(alpha: 0.4),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                iconData,
                color: AppColors.creamColor,
                size: 20,
              ),
            ),
            HorizontalSpaceBox.s12,
            Text(name,
                style:
                    const TextStyle(fontSize: 16, color: AppColors.creamColor)),
            const Spacer(),
            const Icon(IconlyLight.arrowRight2,
                size: 16, color: AppColors.iceBlue),
          ],
        ),
      ),
    );
  }
}
