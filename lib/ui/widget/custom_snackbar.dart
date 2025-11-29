import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';

enum SnackbarType {
  success,
  warning,
  error,
}

class CustomSnackbar extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onClose;
  final String message;
  final SnackbarType type;

  const CustomSnackbar({
    super.key,
    required this.isVisible,
    required this.onClose,
    required this.message,
    required this.type,
  });

  Color getBackgroundColor() {
    switch (type) {
      case SnackbarType.success:
        return AppColors.lightGreen; // Define your success color
      case SnackbarType.warning:
        return AppColors.lightYellow; // Define your warning color
      case SnackbarType.error:
        return AppColors.lightRed; // Define your error color
    }
  }

  Color getTextColor() {
    return AppColors.creamColor; // You can customize this if needed
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isVisible ? 60.0 : 0.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bodyText3.copyWith(color: getTextColor()),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: Icon(Icons.close, color: getTextColor()),
              onPressed: onClose,
            ),
          ),
        ],
      ),
    );
  }
}
