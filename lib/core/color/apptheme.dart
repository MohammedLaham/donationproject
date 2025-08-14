import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: primaryColor),
  appBarTheme: AppBarTheme( 
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: primaryColor),
    titleTextStyle:const  TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: 25),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: blackColor),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: blackColor),
      bodyLarge: TextStyle(
          height: 2,
          color: grayColor,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: grayColor, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: blackColor),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: blackColor),
      bodyLarge: TextStyle(
          height: 2,
          color: grayColor,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: grayColor, fontSize: 14)),
  primarySwatch: Colors.blue,
);
