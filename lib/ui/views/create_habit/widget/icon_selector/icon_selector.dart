import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/create_habit/widget/icon_selector/icon_selector_viewmodel.dart';

class IconSelector extends StatelessWidget {
  final Color selectedColor;
  final Function(String) onIconSelected;

  const IconSelector({
    super.key,
    required this.onIconSelected,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IconSelectorViewModel>.reactive(
      viewModelBuilder: () => IconSelectorViewModel(),
      builder: (context, model, child) {
        return SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      model.iconPack.length > 10 ? 10 : model.iconPack.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == model.displayedIndex;
                    final iconColor =
                        isSelected ? selectedColor : AppColors.creamColor;

                    return GestureDetector(
                      onTap: () {
                        model.selectIcon(index);
                        onIconSelected(model.selectedIconName);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: isSelected
                              ? Border.all(color: iconColor, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            model.iconPack[index],
                            colorFilter:
                                ColorFilter.mode(iconColor, BlendMode.srcIn),
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // "More Icons" button
              TextButton(
                onPressed: () => _showMoreIcons(context, model),
                child: Text(
                  "More Icons",
                  style: TextStyle(
                    color: AppColors.iceBlue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMoreIcons(BuildContext context, IconSelectorViewModel model) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.blackColor,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select an Icon", style: AppTextStyles.headlineSmall),
                VerticalSpaceBox.s16,
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                    itemCount: model.iconPack.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final isSelected = model.displayedIndex == index;
                      final iconColor =
                          isSelected ? AppColors.iceBlue : AppColors.creamColor;

                      return GestureDetector(
                        onTap: () {
                          model.moveIconToFront(index);
                          onIconSelected(model.selectedIconName);
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: isSelected
                                ? Border.all(color: iconColor, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              model.iconPack[index],
                              colorFilter:
                                  ColorFilter.mode(iconColor, BlendMode.srcIn),
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
