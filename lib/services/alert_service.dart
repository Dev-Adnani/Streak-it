import 'package:flutter/material.dart';

class AlertService {
  // Customizable Alert
  Future<void> showCustomAlert({
    Widget? widget,
    required BuildContext context,
    required String gif,
    bool dismissible = true,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  gif,
                  fit: BoxFit.contain,
                ),
                widget ?? Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
