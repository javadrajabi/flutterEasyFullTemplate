import 'package:template/ui/chat/conversation_screen_ui.dart';
import 'package:template/ui/details/details_page.dart';
import 'package:template/ui/details/servant_datails.dart';
import 'package:template/ui/get_service/select_turn_date/turn_date.dart';
import 'package:template/ui/get_service/services.dart';
import 'package:template/ui/home/home.dart';
import 'package:template/ui/login/login.dart';
import 'package:template/ui/notification/notif_list.dart';
import 'package:template/ui/splashScreen.dart';
import 'package:template/widget/widgets/expandable-bottom-bar/src/controller.dart';
import '../../ui/language.dart';
import 'package:flutter/material.dart';

//'/addcard2' : (BuildContext context) => new DynamicFieldsPage(),
//'/addcard' : (BuildContext context) => new Addcardmaterial(),

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {

      ////--------- LOGIN ---------////

      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => VerificationPhone ());

      ////--------- USERS HOME ---------////

      case '/home':
        return MaterialPageRoute(builder: (_) => DefaultBottomBarController(child:Home()));
      case '/language':
        return MaterialPageRoute(builder: (_) => Language());
      // case '/alertSetting':
      //   return MaterialPageRoute(builder: (_) => AlertSetting());
      // case '/smsAlertSetting':
      //   return MaterialPageRoute(builder: (_) => SmsAlertSetting());
      // case '/deviceSetting':
      //   return MaterialPageRoute(builder: (_) => DeviceSetting());
      // case '/devices':
      //   return MaterialPageRoute(builder: (_) => Devices());
      case '/chatScreen':
        return MaterialPageRoute(builder: (_) => ConversationScreen(data: args));
      case '/turnDetails':
        return MaterialPageRoute(builder: (_) => DetailsView());
      case '/servantDetails':
        return MaterialPageRoute(builder: (_) => ServantDetails());
      case '/services':
        return MaterialPageRoute(builder: (_) => Services(selectedService: args,));
      case '/selectTurnDate':
        return MaterialPageRoute(builder: (_) => SelectTurnDate(arg: args,));
      case '/notifList':
        return MaterialPageRoute(builder: (_) => NotifList());

    ////--------- ADMIN HOME ---------////


        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
       // return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(routeName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR : $routeName route not found'),
        ),
      );
    });
  }
}