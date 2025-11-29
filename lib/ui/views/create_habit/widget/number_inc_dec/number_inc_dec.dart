import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class NumberIncDec extends StatelessWidget {
  final int value;
  final String info;
  final Function() onIncrease;
  final Function() onDecrease;

  const NumberIncDec({
    super.key,
    required this.value,
    required this.onIncrease,
    required this.info,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.creamColor,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          HorizontalSpaceBox.s8,
          HorizontalSpaceBox.s8,
          Text("Completion Goal in $info", style: AppTextStyles.bodyText3),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: AppColors.rosyBrown,
            ),
            onPressed: onDecrease,
          ),
          Text(value.toString()),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.rosyBrown,
            ),
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}
