import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color.dart';
import 'myTextTheme.dart';

class MyTheme {
  MyTheme._();

  static ThemeData lightTheme() => ThemeData(
      primaryColor: accentColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(accentColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16.0), // Apply border radius here
          ),
        ),
      )),
      buttonTheme: ButtonThemeData(buttonColor: accentColor),
      scaffoldBackgroundColor: primaryColor,
      brightness: Brightness.light,
      textTheme: MyTextTheme.lightTextTheme(),
      useMaterial3: false,
      fontFamily: GoogleFonts.ubuntu.toString(),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      hintColor: hintColor,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStatePropertyAll(accentColor),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: accentColor,
      ),
      primaryColorLight: primaryColor,
      iconTheme:
          const IconThemeData(color: Colors.black, size: 24, weight: 500),
      cardColor: Colors.white,
      drawerTheme: DrawerThemeData(backgroundColor: primaryColor),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(accentColor.value, {
        50: accentColor.withOpacity(0.1),
        100: accentColor.withOpacity(0.2),
        200: accentColor.withOpacity(0.3),
        300: accentColor.withOpacity(0.4),
        400: accentColor.withOpacity(0.5),
        500: accentColor.withOpacity(0.6),
        600: accentColor.withOpacity(0.7),
        700: accentColor.withOpacity(0.8),
        800: accentColor.withOpacity(0.9),
        900: accentColor.withOpacity(1),
      })).copyWith(surface: primaryColor));

  static ThemeData darkTheme() => ThemeData(
      scaffoldBackgroundColor: primaryDarkColor,
      primaryColor: accentColor,
      buttonTheme: ButtonThemeData(buttonColor: accentDarkColor),
      brightness: Brightness.dark,
      textTheme: MyTextTheme.darkTextTheme(),
      useMaterial3: false,
      fontFamily: GoogleFonts.ubuntu.toString(),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: accentColor,
        elevation: 0,
        centerTitle: true,
      ),
      hintColor: hintColor,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStatePropertyAll(accentDarkColor),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: accentColor,
      ),
      primaryColorDark: primaryDarkColor,
      cardColor: Colors.black,
      iconTheme:
          const IconThemeData(color: Colors.white, size: 24, weight: 500),
      primarySwatch: MaterialColor(accentColor.value, {
        50: accentColor.withOpacity(0.1),
        100: accentColor.withOpacity(0.2),
        200: accentColor.withOpacity(0.3),
        300: accentColor.withOpacity(0.4),
        400: accentColor.withOpacity(0.5),
        500: accentColor.withOpacity(0.6),
        600: accentColor.withOpacity(0.7),
        700: accentColor.withOpacity(0.8),
        800: accentColor.withOpacity(0.9),
        900: accentColor.withOpacity(1),
      }),
      drawerTheme: DrawerThemeData(backgroundColor: primaryDarkColor));
}
