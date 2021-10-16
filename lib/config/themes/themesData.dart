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
    primaryColorBrightness: Brightness.light,
    accentColor: Colors.orange[500],
    accentColorBrightness: Brightness.light
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: 'IRANSans_medium',
  brightness: Brightness.dark,
  primaryColor: Colors.blue[500],
  primaryColorBrightness: Brightness.dark,
  accentColor: Colors.blue[500],
  accentColorBrightness: Brightness.dark,
);


class ThemeStore with ChangeNotifier{
  final String TAG = "_ThemeStore";
  late final Repository _repository;
  // store variables:-----------------------------------------------------------

  bool _darkMode = false;


  // getters:-------------------------------------------------------------------
  bool get darkMode => _darkMode;

  // actions:-------------------------------------------------------------------

  Future changeBrightnessToDark() async {
    _darkMode = !_darkMode;
    await _repository.changeBrightnessToDark(_darkMode);
  }

  // general methods:-----------------------------------------------------------
  Future init() async {
    _darkMode = _repository.isDarkMode;
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;


}