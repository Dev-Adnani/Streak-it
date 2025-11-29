import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:streakit/local/habit_constants.dart';
import 'package:streakit/ui/common/app.colors.dart';

class ReminderDays extends StatelessWidget {
  final Function(List<String>) onListChanged;
  final MultiSelectController<String>? reminderMultiSelectController;
  const ReminderDays(
      {super.key,
      required this.onListChanged,
      this.reminderMultiSelectController});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>.multiSelect(
      multiSelectController: reminderMultiSelectController,
      onListChanged: (p0) {
        onListChanged(p0);
      },
      listItemPadding: const EdgeInsets.all(10),
      closedHeaderPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: CustomDropdownDecoration(
        prefixIcon:
            const Icon(IconlyLight.calendar, color: AppColors.creamColor),
        closedBorder: Border.all(color: AppColors.creamColor, width: 2),
        closedFillColor: AppColors.blackColor,
        expandedFillColor: AppColors.blackColor,
        listItemDecoration: const ListItemDecoration(
          selectedColor: AppColors.blackColor,
        ),
        expandedSuffixIcon: const Icon(
          IconlyLight.arrowUp2,
          size: 20,
          color: AppColors.creamColor,
        ),
        closedSuffixIcon: const Icon(
          IconlyLight.arrowDown2,
          size: 20,
          color: AppColors.creamColor,
        ),
      ),
      hintText: 'Select Week Days',
      items: HabitConstants.weekDays,
    );
  }
}
