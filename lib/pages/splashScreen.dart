import 'package:template/config/themes/my_drawing.dart';
import 'package:template/data/sharedpref/shared_preference_helper.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:template/data/webService/requests/users.dart';
import '../data/local/datasources/LocalDB.dart';
import '../data/webService/httpRequest.dart';
import 'package:flutter/material.dart';
// import '../database/SharedPreferences.dart';
import 'package:overlay_support/overlay_support.dart';
import '../services/local_notification_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkLogin() async {
    // await LocalDB.getPath();
    //
    // if (await SharedPreferenceHelper.isSetToken()) {
    //   Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    // } else {
    //   Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    //   // onClick();
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

  String password = '';
  bool enterPass = false;



  init() async {

    if (await SharedPreferenceHelper.isPasswordSet()) {
      password = await SharedPreferenceHelper.getPassword();
      print(password);
      setState(() {
        enterPass = true;
      });
    } else {
      this._checkLogin();
    }
  }

  TextEditingController ctr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     init();
    // LocalNotificationService.initialize(context);

    // ///gives you the message on which user taps
    // ///and it opened the app from terminated state
    // FirebaseMessaging.instance.getInitialMessage().then((message) {
    //   print(message?.notification?.title );
    //   // if(message != null){
    //   //   final routeFromMessage = message.data["route"];
    //   //
    //   //   Navigator.of(context).pushNamed(routeFromMessage);
    //   // }
    // });
    //
    // ///forground work
    // FirebaseMessaging.onMessage.listen((message) {
    //   if(message.notification != null){
    //     print(message.notification!.body);
    //     print(message.notification!.title);
    //   }
    //
    //   LocalNotificationService.display(message);
    // });
    //
    // ///When the app is in background but opened and user taps
    // ///on the notification
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   final routeFromMessage = message.data["route"];
    //
    //   Navigator.of(context).pushNamed(routeFromMessage);
    // });



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

          Icon(MyIcon.gps_icon3,size: 100,),
           SizedBox(height: 20,),
           enterPass
                ? Container(
              width: MediaQuery.of(context).size.width * 0.8,
              // padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                onChanged: (s) {
                  print([password,s,password.toString() == s]);
                  if (s == password) {
                    _checkLogin();
                  }
                },
                autofocus: false,
                maxLength: 11,
                controller: ctr,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 22.0, color: MyColors.gray),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MyColors.cyanLite,
                  hintText: 'پسورد را وارد کنید',
                  counter: Offstage(),
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, right: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.cyanLite),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.cyanLite),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            )
                : Text('ردیاب وسگا '),

        ],),
      ),
    );
  }
}
