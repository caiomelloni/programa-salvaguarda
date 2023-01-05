import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';

ThemeData? appTheme() {
  return ThemeData(
    primaryColor: AppColors.lightPurple,
    focusColor: AppColors.yellow,
    primarySwatch: MaterialColor(0xFF8C3FB6, appMaterialColor),
  );
}

Map<int, Color> appMaterialColor = {
  50: const Color.fromRGBO(140, 63, 182, 0.1),
  100: const Color.fromRGBO(140, 63, 182, .2),
  200: const Color.fromRGBO(140, 63, 182, .3),
  300: const Color.fromRGBO(140, 63, 182, .4),
  400: const Color.fromRGBO(140, 63, 182, .5),
  500: const Color.fromRGBO(140, 63, 182, .6),
  600: const Color.fromRGBO(140, 63, 182, .7),
  700: const Color.fromRGBO(140, 63, 182, .8),
  800: const Color.fromRGBO(140, 63, 182, .9),
  900: const Color.fromRGBO(140, 63, 182, 1),
};
