
import 'package:flutter/material.dart';

class Config {
  Config._();

  static const String mapUrl =
      "http://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png";
  static const String mail = 'support@argustec.org';
  // static const String url = "https://argustec.org";
  static const String urlT = "https://t.me/rover3dx";
  static const String urlI = "https://www.instagram.com/rover3dx";
  static const String version = '1.2.0';
  static const double IconSize = 100.0;
  static const double FirstFontSize = 25.0;
  static Color background = Color(0xFFf7f7f7);
  static Color secondBackground = Color(0xFFf7f7f7);
  static Color item = Color(0xFFf2f2f2);
  static Color button = Color(0xFFe6e6e6);
  static Color text = Color(0xFFcccccc);

  // static Future<void> saveTokenToDatabase(String token) async {
  //   ApiUsers.sendDeviceToken(token);
  // }
  // static Future<String> getDeviceId() async {
//    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//    if (Platform.isIOS) {
//      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
//      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
//    } else {
//      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
//      return androidDeviceInfo.androidId; // unique ID on Android
//    }


  // }

}
