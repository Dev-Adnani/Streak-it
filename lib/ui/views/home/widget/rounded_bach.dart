import 'package:flutter/material.dart';
import 'package:streakit/local/habit_constants.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class SelectableCategoryRow extends StatefulWidget {
  final List<HabitCategory> categories;
  final ValueChanged<List<HabitCategory>> onSelectionChanged;

  const SelectableCategoryRow({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
  });

  @override
  SelectableCategoryRowState createState() => SelectableCategoryRowState();
}

class SelectableCategoryRowState extends State<SelectableCategoryRow> {
  final List<HabitCategory> _selectedCategories = [];

  void _toggleSelection(HabitCategory category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
    widget.onSelectionChanged(_selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.categories.map((category) {
            final isSelected = _selectedCategories.contains(category);
            return GestureDetector(
              onTap: () => _toggleSelection(category),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: SelectableBadge(
                  title: category.name,
                  icon: category.icon,
                  isSelected: isSelected,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SelectableBadge extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const SelectableBadge({
    required this.title,
    required this.icon,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: [
                  AppColors.iceBlue.withValues(alpha: 0.4),
                  AppColors.blackColor.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isSelected ? null : Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: isSelected
              ? AppColors.iceBlue.withValues(alpha: 0.2)
              : AppColors.greyish,
          width: 1.5,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.iceBlue.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                )
              ]
            : [],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey.shade300,
            size: 20,
          ),
          HorizontalSpaceBox.s5,
          Text(
            title,
            style: AppTextStyles.labelLarge.copyWith(
              fontSize: FontSizes.s12,
              color: isSelected ? Colors.white : Colors.grey.shade300,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
