import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  const CustomTheme();
  static final defaultThemeData = ThemeData(
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    //Dialog Color
    colorScheme: ColorScheme.light(
      primary: CustomColors.primaryColor,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    primaryColor: CustomColors.primaryColor,
    accentColor: CustomColors.accentColor,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: CustomColors.primaryColor,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: CustomColors.primaryColor,
      ),
      headline2: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: CustomColors.primaryColor,
      ),
      headline3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: CustomColors.primaryColor,
      ),
      headline4: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headline5: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: CustomColors.primaryColor,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: CustomColors.primaryColor,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: CustomColors.accentColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: CustomColors.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        // overlayColor: MaterialStateProperty.all(
        //   Colors.transparent,
        // ),
        foregroundColor: MaterialStateProperty.all(
          CustomColors.primaryColor,
        ),
      ),
    ),
  );
}
