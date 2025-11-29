import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';

Widget colorSelector({
  required int selectedIndex,
  required Function(int) onColorSelected,
}) {
  return SizedBox(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: AppColors.getHabitColorList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onColorSelected(index);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.getHabitColorList[index],
              shape: BoxShape.rectangle,
              border: selectedIndex == index ? Border.all() : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: selectedIndex == index
                ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    ),
  );
}
