import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:testarget/core/ui/const_colors.dart';
import 'package:testarget/core/ui/extensions/size_screen_extension.dart';
import 'package:testarget/core/ui/text_styles.dart';

class AlertAsuka {
  AlertAsuka._();

  static void alert(String message) {
    AsukaSnackbar.alert(message).show();
  }

  static void info(String message) {
    AsukaSnackbar.info(message).show();
  }

  static void warning(String message) {
    AsukaSnackbar.warning(message).show();
  }

  static void success(String message) {
    Asuka.showSnackBar(SnackBar(
      backgroundColor: ConstColors.primary,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            size: 20,
            color: ConstColors.white,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              message,
              style: FactoryTextStyles.bodySmall(),
            ),
          ),
          InkWell(
            onTap: Asuka.hideCurrentSnackBar,
            child: const Icon(Icons.close, color: Colors.white),
          )
        ],
      ),
    ));
  }
}
