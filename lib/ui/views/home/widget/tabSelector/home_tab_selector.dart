import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:streakit/ui/common/app.colors.dart';

class HomeTabSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const HomeTabSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TabItem(
            icon: IconlyLight.calendar,
            isSelected: selectedIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          _TabItem(
            icon: Icons.web_stories_outlined,
            isSelected: selectedIndex == 1,
            onTap: () => onTabSelected(1),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.creamColor.withValues(alpha: 0.1),
                    blurRadius: 2,
                    blurStyle: BlurStyle.inner,
                  )
                ]
              : [],
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.iceBlue : AppColors.greyish,
        ),
      ),
    );
  }
}
