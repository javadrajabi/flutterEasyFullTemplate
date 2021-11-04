import 'dart:async';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/data/sharedpref/shared_preference_helper.dart';

class Repository {
  static String? deviceToken;

  static const String BaseURL = 'http://192.168.1.187/lumen_api/public';

  static final navigatorKey = GlobalKey<NavigatorState>();

  static saveToken(token) {
    deviceToken = token;
    SharedPreferenceHelper.saveAuthToken(token);
  }

  static getToken() async {
    deviceToken = await SharedPreferenceHelper.getAuthToken();
    return deviceToken;
  }

  static showRequestMessage(String text) {
    showDialog<void>(
      context: Repository.navigatorKey.currentContext!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اخطار'),
          content: SingleChildScrollView(
            child: ListBody(children: <Widget>[
              Text(text),
            ]),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('تایید'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showLoadingAlert() {
    if (!Repository.navigatorKey.currentContext!.loaderOverlay.visible ) {
      Repository.navigatorKey.currentContext!.loaderOverlay.show(
        widget: Center(
          child: RefreshProgressIndicator(),
        )

      );
    }
  }
  static closeLoadingAlert(){
    if (Repository.navigatorKey.currentContext!.loaderOverlay.visible ) {
      Repository.navigatorKey.currentContext!.loaderOverlay.hide();
    }

  }
// Login:---------------------------------------------------------------------
// Future<bool> login(String email, String password) async {
//   return await Future.delayed(Duration(seconds: 2), ()=> true);
// }
//
// Future<void> saveIsLoggedIn(bool value) =>
//     _sharedPrefsHelper.saveIsLoggedIn(value);
//
// Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
//
// // Theme: --------------------------------------------------------------------
// Future changeBrightnessToDark(bool value) {
//
//
// }
//
//
// bool get isDarkMode => _sharedPrefsHelper.isDarkMode;
//
// // Language: -----------------------------------------------------------------
// Future<void> changeLanguage(String value) =>
//     _sharedPrefsHelper.changeLanguage(value);
//
// String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
