import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.text.theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          buttonName,
          style: AppTextStyles.button.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
