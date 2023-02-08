import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final appTheme = ThemeData(
    fontFamily: 'Inter',
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.blackText,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: AppColors.blackText),
    ),
  );

  static final whiteShadow = BoxShadow(
    color: Colors.black.withOpacity(.05),
    blurRadius: 6.0,
  );
}
