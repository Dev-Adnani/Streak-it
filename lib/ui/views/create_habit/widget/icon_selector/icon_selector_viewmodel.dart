import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.assets.dart';

class IconSelectorViewModel extends BaseViewModel {
  late List<String> iconPack;
  late int displayedIndex;

  IconSelectorViewModel() {
    iconPack = List.from(AppIconPack.iconPack);
    displayedIndex = 0;
  }

  String get selectedIconName => iconPack[displayedIndex];

  void selectIcon(int index) {
    displayedIndex = index;
    notifyListeners();
  }

  void moveIconToFront(int index) {
    final selectedIcon = iconPack.removeAt(index);
    iconPack.insert(0, selectedIcon);
    displayedIndex = 0;
    notifyListeners();
  }
}
