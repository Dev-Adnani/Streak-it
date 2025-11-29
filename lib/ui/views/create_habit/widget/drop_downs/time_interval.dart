import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:streakit/local/habit_constants.dart';
import 'package:streakit/ui/common/app.colors.dart';

class TimeInterval extends StatelessWidget {
  final String intervalType;
  final Function(String) onIntervalSelected;

  const TimeInterval({
    super.key,
    required this.intervalType,
    required this.onIntervalSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      listItemPadding: const EdgeInsets.all(10),
      initialItem: intervalType,
      closedHeaderPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(color: AppColors.creamColor, width: 2),
        closedFillColor: AppColors.blackColor,
        expandedFillColor: AppColors.blackColor,
        closedSuffixIcon: const Icon(
          IconlyLight.arrowDown2,
          size: 20,
          color: AppColors.creamColor,
        ),
        expandedSuffixIcon: const Icon(
          IconlyLight.arrowUp2,
          size: 20,
          color: AppColors.creamColor,
        ),
      ),
      hintText: 'Select Time Interval',
      items: HabitConstants.intervalType,
      onChanged: (value) {
        onIntervalSelected(value ?? intervalType);
      },
    );
  }
}
