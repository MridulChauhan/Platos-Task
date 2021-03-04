import 'package:flutter/material.dart';
import 'package:platos_task/values/colors.dart';

class AppTheme {
  static ThemeData get theme {
    Color primaryColor = Color.fromARGB(255, 255, 255, 255);
    Color primaryColorLight = Color.fromARGB(255, 243, 246, 254);
    Color backgroundColor = Color(0xff);
    Color scaffoldBackgroundColor = AppColors.scbkd1;
    const Color primaryText = AppColors.sctxt;
    const Color appBarColor = AppColors.appbarclr;

    final originalTextTheme = ThemeData.light().textTheme;

    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
          color: appBarColor,
          iconTheme: IconThemeData(color: AppColors.white, size: 25.0),
          textTheme: originalTextTheme.copyWith(
              headline1: originalTextTheme.headline1.copyWith(
                  fontFamily: '',
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.sctxt))),
      primaryColorLight: primaryColorLight,
      accentColor: AppColors.appbarclr,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      errorColor: Colors.red,
      textTheme: originalTextTheme.copyWith(
        headline1: originalTextTheme.headline1.copyWith(
            fontFamily: '',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: primaryText),
        headline2: originalTextTheme.headline1.copyWith(
            fontFamily: '',
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: primaryText),
        headline3: originalTextTheme.headline1.copyWith(
            fontFamily: '',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: primaryText),
        headline4: originalTextTheme.headline1.copyWith(
            fontFamily: '',
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: primaryText),
        headline5: originalTextTheme.headline1.copyWith(
            fontFamily: '',
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: primaryText),
        headline6: originalTextTheme.headline1.copyWith(
            fontFamily: '',
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
            color: primaryText),
      ),
    );
  }
}
