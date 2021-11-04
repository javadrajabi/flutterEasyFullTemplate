import 'package:connectivity/connectivity.dart';
import '../config/languages/localization/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static String tT(BuildContext context, String key) {
    if (key != '') {
      return AppLocalization.of(context)!.translate(key);
    } else {
      return '';
    }
  }

  static bool? checkEmailFormat(String email) {
    bool? emailFormat;
    if (email != '') {
      emailFormat = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }
    return emailFormat;
  }

  static DateTime? previous;

  static void psPrint(String msg) {
    final DateTime now = DateTime.now();
    int min = 0;
    if (previous == null) {
      previous = now;
    } else {
      min = now.difference(previous!).inMilliseconds;
      previous = now;
    }

    print('$now ($min)- $msg');
  }

  static String convertColorToString(Color color) {
    String convertedColorString = '';

    String colorString = color.toString().toUpperCase();

    colorString = colorString.replaceAll(')', '');

    convertedColorString = colorString.substring(colorString.length - 6);

    return '#' + convertedColorString;
  }

  // static Future<bool> requestWritePermission() async {
  //   // final Map<Permission, PermissionStatus> permissionss =
  //   //     await PermissionHandler()
  //   //         .requestPermissions(<Permission>[Permission.storage]);
  //   // if (permissionss != null &&
  //   //     permissionss.isNotEmpty &&
  //   //     permissionss[Permission.storage] == PermissionStatus.granted) {
  //   final Permission _storage = Permission.storage;
  //   final PermissionStatus permissionss = await _storage.request();
  //
  //   if (permissionss != null && permissionss == PermissionStatus.granted) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      print('No Connection');
      return false;
    } else {
      return false;
    }
  }

  // static dynamic launchURL() async {
  //   final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   print(packageInfo.packageName);
  //   final String url =
  //       'https://play.google.com/store/apps/details?id=${packageInfo.packageName}';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
