import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';

class CustomTextField {
  static customTextField(
      {required TextEditingController textEditingController,
      required String hintText,
      String? Function(String?)? validator,
      Function(String)? onChanged}) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      onChanged: onChanged,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        fillColor: AppColors.creamColor,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColors.iceBlue, width: 2),
        ),
        errorStyle: AppTextStyles.bodyText3.copyWith(
          color: AppColors.lightRed,
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColors.indianRed, width: 2),
        ),
      ),
    );
  }

  static Widget customTextFieldTwo({
    required TextEditingController textEditingController,
    required String hintText,
    required String labelText,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    bool readOnly = false,
    Function()? onTap,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return TextFormField(
      style: AppTextStyles.bodyText3,
      onChanged: onChanged,
      controller: textEditingController,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: AppColors.blackColor,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.greyish,
        ),
        labelText: labelText,
        labelStyle: AppTextStyles.bodyText3,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Icon(prefixIcon, color: AppColors.creamColor),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: AppColors.creamColor)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.creamColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.creamColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.creamColor,
            width: 2.5,
          ),
        ),
        errorStyle: AppTextStyles.bodyText3.copyWith(
          color: AppColors.lightYellow,
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.indianRed,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.indianRed,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
