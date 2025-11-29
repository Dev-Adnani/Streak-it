import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:streakit/local/habit_constants.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class HabitCategoryDropDown extends StatelessWidget {
  final Function(List<String>) onListChanged;
  final MultiSelectController<String>? habitCategoryMultiSelectController;

  const HabitCategoryDropDown({
    super.key,
    required this.onListChanged,
    this.habitCategoryMultiSelectController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>.multiSelect(
      multiSelectController: habitCategoryMultiSelectController,
      items: HabitConstants.habitCategories.map((e) => e.name).toList(),
      onListChanged: (p0) {
        onListChanged(p0);
      },
      listItemPadding: const EdgeInsets.all(10),
      closedHeaderPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      listItemBuilder: (context, item, selected, onTap) {
        return Row(
          children: [
            Icon(
              HabitConstants.habitCategories
                  .firstWhere((element) => element.name == item)
                  .icon,
              color: selected ? AppColors.iceBlue : AppColors.creamColor,
            ),
            HorizontalSpaceBox.s16,
            Text(
              item,
              style: AppTextStyles.bodyText3.copyWith(
                  color: selected ? AppColors.iceBlue : AppColors.creamColor),
            ),
            const Spacer(),
            selected
                ? const Icon(
                    Icons.check,
                    color: AppColors.iceBlue,
                  )
                : const Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: AppColors.creamColor,
                  ),
          ],
        );
      },
      decoration: CustomDropdownDecoration(
        prefixIcon: const Icon(
          IconlyLight.category,
          color: AppColors.creamColor,
        ),
        searchFieldDecoration: SearchFieldDecoration(
          textStyle:
              AppTextStyles.bodyText3.copyWith(color: AppColors.blackColor),
        ),
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
      hintText: 'Select Habit Category',
    );
  }
}
