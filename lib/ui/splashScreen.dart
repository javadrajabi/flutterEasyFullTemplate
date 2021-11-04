import 'dart:async';

import 'package:provider/src/provider.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/data/repository.dart';
import 'package:template/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:template/provider/localization.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _checkLogin() async {
    // await LocalDB.getPath();
    //
    // if (SharedPreferenceHelper.isSetAuthToken()) {
    //   await Repository.getToken();
      Navigator.of(context).pushNamedAndRemoveUntil('/language', (route) => false);
      // Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    // } else {
    //   toast('Hello!');
    //   Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    //   //   // onClick();
    // }
  }

  void onClick() {
    // popup a toast.
    toast('Hello!');

    // show a notification at top of screen.
    // showSimpleNotification(
    //     Text("this is a message from simple notification"),
    //     background: Colors.green);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLanguage();
    checkTheme();
    Future.delayed(Duration(seconds: 1), () {
      _checkLogin();
    });
  }

  Future checkLanguage() async {
    String? lang = SharedPreferenceHelper.currentLanguage;
    print(lang);
    if(lang!=null){
      context.read<LocalizationData>().setLocale(lang);
    }
  }
  Future checkTheme() async {
    bool? isDark = SharedPreferenceHelper.isDarkMode;
    print(isDark);

      context.read<LocalizationData>().setBrightnes(isDark);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.donut_small_outlined,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              ' دورنیکا تایم ',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
