import 'package:flutter/material.dart';
import 'package:testarget/core/ui/const_colors.dart';

import 'text_styles.dart';


class ButtonDefault extends StatelessWidget {
  const ButtonDefault({
    super.key,
    required this.label,
    required this.onPressed,
    this.size,
    this.labelStyle,
    this.labelAlign,
    this.sufixIcon,
    this.prefixIcon,
    this.elevation = 3,
    this.backgroundColor = ConstColors.green100,
    this.foregroundColor = ConstColors.green100,
    this.textColor = Colors.white,
    this.shadowColor = Colors.transparent,
    this.isDisabled = false,
    this.borderStyle = BorderSide.none,
  });

  const ButtonDefault.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.size,
    this.labelStyle,
    this.labelAlign,
    this.sufixIcon,
    this.prefixIcon,
    this.elevation,
    this.backgroundColor = ConstColors.red300,
    this.foregroundColor = ConstColors.white300,
    this.textColor = Colors.white,
    this.shadowColor = Colors.transparent,
    this.isDisabled = false,
    this.borderStyle = BorderSide.none,
  });

  const ButtonDefault.highlight({
    super.key,
    required this.label,
    required this.onPressed,
    this.size,
    this.labelStyle,
    this.labelAlign,
    this.sufixIcon,
    this.prefixIcon,
    this.backgroundColor = ConstColors.primary,
    this.foregroundColor = ConstColors.white,
    this.textColor = Colors.white,
    this.elevation,
    this.shadowColor = ConstColors.blackFull,
    this.isDisabled = false,
    this.borderStyle = BorderSide.none,
  });

  const ButtonDefault.outline({
    super.key,
    required this.label,
    required this.onPressed,
    this.size,
    this.labelStyle,
    this.labelAlign,
    this.sufixIcon,
    this.prefixIcon,
    this.backgroundColor = Colors.transparent,
    this.textColor = ConstColors.blackFull,
    this.isDisabled = false,
    this.elevation,
    this.foregroundColor = ConstColors.white300,
    this.shadowColor = Colors.transparent,
    this.borderStyle = const BorderSide(
      color: ConstColors.blackFull,
      width: 1.5,
    ),
  });

  final String label;
  final VoidCallback onPressed;
  final Size? size;
  final TextStyle? labelStyle;
  final Alignment? labelAlign;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final bool isDisabled;
  final BorderSide? borderStyle;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isDisabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        fixedSize: size ?? const Size(double.maxFinite, 55),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shadowColor: shadowColor,
        alignment: labelAlign,
        textStyle: labelStyle,
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: borderStyle!,
        ),
      ),
      child: Row(
        mainAxisAlignment: (sufixIcon != null || prefixIcon != null)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Visibility(
            visible: prefixIcon != null,
            child: Icon(prefixIcon, color: textColor),
          ),
          Text(
            label,
            style: labelStyle ?? 
            FactoryTextStyles.bodySmall(
              color: textColor!,
            ),
          ),
          Visibility(
            visible: sufixIcon != null,
            child: Icon(sufixIcon, color: textColor),
          ),
        ],
      ),
    );
  }
}
