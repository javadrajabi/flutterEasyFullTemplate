import 'package:flutter/material.dart';
import 'package:template/data/repository.dart';

class MyTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
// Define the default brightness and colors.
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'IRANSans_medium');
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(brightness: Brightness.dark, primarySwatch: Colors.teal);
  }
}


final ThemeData themeData = new ThemeData(
    fontFamily: 'IRANSans_medium',
    brightness: Brightness.light,
    // primarySwatch: MaterialColor(Colors.orange[500]!.value,{ } ),
    primaryColor: Colors.orange[500],
    primaryColorBrightness: Brightness.light, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange[500])
);

final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    fontFamily: 'IRANSans_medium');

