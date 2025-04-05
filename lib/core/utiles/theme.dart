import 'package:cerboscan/core/utiles/const.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 4,
    surfaceTintColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: primaryColor,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
);
