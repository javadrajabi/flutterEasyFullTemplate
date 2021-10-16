import 'package:flutter/material.dart';

class LanguageHelper {
  convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = Locale('en', 'EN');
        break;
      case 'فارسی':
        convertedLocale = Locale('fa', 'IR');
        break;
      case 'Français':
        convertedLocale = Locale('fr', 'FR');
        break;
      case 'Español':
        convertedLocale = Locale('es', 'ES');
        break;
      case 'Русский':
        convertedLocale = Locale('ru', 'RU');
        break;
      default:
        convertedLocale = Locale('en', 'EN');
    }

    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'fa':
        langName = "فارسی";
        break;
      case 'fr':
        langName = "Français";
        break;
      case 'es':
        langName = "Español";
        break;
      case 'ru':
        langName = "Русский";
        break;
      default:
        langName = "English";
    }

    return langName;
  }
}
