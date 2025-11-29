import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData iconData;
  final String? title;
  final List<Widget>? children;
  final void Function()? onPressed;
  final Color iconColor;

  const CustomAppBar({
    super.key,
    required this.iconData,
    this.title,
    required this.iconColor,
    this.children,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.blackColor,
      leading: IconButton(
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: AppColors.creamColor,
        ),
      ),
      actions: children,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
