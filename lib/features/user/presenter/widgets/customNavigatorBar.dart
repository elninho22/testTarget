import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testarget/features/user/presenter/store/user_store.dart';
import '../../../../core/ui/const_colors.dart';
import '../../../../core/ui/text_styles.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  final UserStore controller;

  const CustomBottomNavigatorBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  UserStore get _controller => controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF277278),
            Color(0xFF205064),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [10, 0.1],
        ),
      ),
      child: TextButton(
        onPressed: () async {
          await _controller.launchInBrowser(
            'https://www.google.com.br',
          );
        },
        child: Text(
          'Política de Privacidade',
          style: FactoryTextStyles.bodySmall(color: ConstColors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
