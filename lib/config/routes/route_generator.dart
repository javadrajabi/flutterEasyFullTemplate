import 'package:template/models/user_model.dart';
import 'package:template/pages/setting/alert_setting.dart';
import 'package:template/pages/setting/device_setting.dart';
import 'package:template/pages/setting/devices.dart';
import 'package:template/pages/setting/sms_alert_setting.dart';
import 'package:template/pages/test/searchDict.dart';
import 'package:template/ui/chat_components/conversation_screen_ui.dart';
import 'package:template/ui/login/login.dart';
import '../../pages/home/home.dart';
import '../../pages/setting/language.dart';
import 'package:flutter/material.dart';
import '../../pages/home/home.dart';
import '../../pages/login/phoneVerification.dart';
import '../../pages/splashScreen.dart';

//'/addcard2' : (BuildContext context) => new DynamicFieldsPage(),
//'/addcard' : (BuildContext context) => new Addcardmaterial(),

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    User user=User(id: 1,imageUrl: '',name: 'reza');
    switch (settings.name) {

      ////--------- LOGIN ---------////

      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/login':
        return MaterialPageRoute(builder: (_) => VerificationPhone ());

      ////--------- USERS HOME ---------////

      case '/home':
        return MaterialPageRoute(builder: (_) => Home(setSelectedTab: args));
      case '/language':
        return MaterialPageRoute(builder: (_) => Language());
      case '/alertSetting':
        return MaterialPageRoute(builder: (_) => AlertSetting());
      case '/smsAlertSetting':
        return MaterialPageRoute(builder: (_) => SmsAlertSetting());
      case '/deviceSetting':
        return MaterialPageRoute(builder: (_) => DeviceSetting());
      case '/devices':
        return MaterialPageRoute(builder: (_) => Devices());
      case '/chatScreen':
        return MaterialPageRoute(builder: (_) => ConversationScreen());

    ////--------- ADMIN HOME ---------////


        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
       // return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}