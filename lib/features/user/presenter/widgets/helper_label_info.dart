import 'package:flutter/material.dart';
import '../../../../core/ui/const_colors.dart';
import '../../../../core/ui/text_styles.dart';

class WidgetHelperLabelInfo extends StatelessWidget {
  final String titile;

  const WidgetHelperLabelInfo({
    Key? key,
    required this.titile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titile,
      style: FactoryTextStyles.bodySmall(color: ConstColors.white)
          .copyWith(fontSize: 24),
      textAlign: TextAlign.left,
    );
  }
}
