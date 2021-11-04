import 'package:flutter/material.dart';
import 'package:template/data/sharedpref/shared_preference_helper.dart';
import '../config/languages/helpers/language_helper.dart';

class LocalizationData with ChangeNotifier {


  // ________________________ LANGUAGE MODE SETTING _______________________
  String currentLanguage = 'فارسی';
  Locale locale = Locale('fa');

  LanguageHelper languageHelper = LanguageHelper();

  Locale get getlocale => locale;

  Future init() async {
    String? lang = SharedPreferenceHelper.currentLanguage;
    _darkMode = SharedPreferenceHelper.isDarkMode;
    // SharedPreferenceHelper.changeLanguage('فارسی');
    print(lang);
    locale = this.languageHelper.convertLangNameToLocale(lang!);
    notifyListeners();
    // final instance = this;
  }
  void setLocale(String newLocale) {
    Locale convertedLocale;
    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    locale = convertedLocale;
    // notifyListeners();
  }
  void changeLocale(String newLocale) {
    Locale convertedLocale;
    SharedPreferenceHelper.changeLanguage(newLocale);
    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    locale = convertedLocale;
    notifyListeners();
  }

  defineCurrentLanguage(context) {
    String definedCurrentLanguage;

    if (currentLanguage != null)
      definedCurrentLanguage = currentLanguage;
    else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }

    return definedCurrentLanguage;
  }


  // ________________________ THEMS MODE SETTING _______________________


  bool _darkMode = false;

  bool get darkMode => _darkMode;
  setBrightnes(bool isDark) {
    _darkMode = isDark;
    // notifyListeners();
  }

  Future changeBrightnessToDark() async {
    _darkMode = !_darkMode;
    SharedPreferenceHelper.changeBrightnessToDark(_darkMode);
    notifyListeners();
  }

  static bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

}
