import 'package:flutter/material.dart';

class AppConstant {
  static const baseUrl = 'https://apitest.lokaly.in/v4/';
  static const version = '0.2.3';
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const blue = Color(0xFFe4f3f7);
  static const lightblue = Color(0xFF23c9fb);
}

class RestaurantTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      accentColor: AppColors.red,
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
        color: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        textTheme: theme.textTheme.copyWith(
          caption: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
      textTheme: theme.textTheme
          .copyWith(
            headline5: theme.textTheme.headline5.copyWith(
                fontSize: 48,
                color: AppColors.white,
                fontWeight: FontWeight.w900),
            headline6: theme.textTheme.headline6.copyWith(
              fontSize: 24,
              color: AppColors.black,
              fontWeight: FontWeight.w900,
            ),
            //

            //product title
            headline4: theme.textTheme.headline4.copyWith(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),

            headline3:
                theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w400),
            //product price
            headline2: theme.textTheme.headline2.copyWith(
                color: AppColors.lightGray,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            headline1:
                theme.textTheme.headline1.copyWith(fontWeight: FontWeight.w500),

            subtitle2: theme.textTheme.headline5.copyWith(
                fontSize: 18,
                color: AppColors.black,
                fontWeight: FontWeight.w400),
            subtitle1: theme.textTheme.headline5.copyWith(
                fontSize: 24,
                color: AppColors.darkGray,
                fontWeight: FontWeight.w500),
            button: theme.textTheme.button.copyWith(
                fontSize: 14,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
            caption: theme.textTheme.caption.copyWith(
                fontSize: 34,
                color: AppColors.black,
                fontWeight: FontWeight.w700),
            bodyText2: theme.textTheme.bodyText2.copyWith(
                color: AppColors.lightGray,
                fontSize: 11,
                fontWeight: FontWeight.w400),
            bodyText1: theme.textTheme.bodyText1.copyWith(
                color: AppColors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400),
          )
          .apply(),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.lightblue,
      ),
    );
  }
}
