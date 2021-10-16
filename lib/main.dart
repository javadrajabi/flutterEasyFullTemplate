import 'package:overlay_support/overlay_support.dart';
import 'package:template/config/config.dart';
import 'package:template/provider/homeProvider.dart';
import '../../provider/api/projects.dart';
import '../../provider/api/tasks.dart';
import '../../provider/api/users.dart';
import '../../provider/baseVar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'config/themes/themesData.dart';
import 'data/local/datasources/LocalDB.dart';
import 'data/sharedpref/shared_preference_helper.dart';
import 'provider/main.dart';
import 'config/routes/route_generator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'provider/localization.dart';
import 'config/languages/localization/app_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// Future<void> backgroundHandler(RemoteMessage message) async{
//   print(message.data.toString());
//   print(message.notification!.title);
// }

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  await LocalDB.init();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);


  // print('--------------------------TOKEN---------------');
  // // print(await messaging.getToken());
  // Config.deviceToken=await messaging.getToken();

    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeP()),
      ChangeNotifierProvider(create: (_) => BaseVar()),
      ChangeNotifierProvider(create: (_) => TasksP()),
      ChangeNotifierProvider(create: (_) => UsersP()),
      ChangeNotifierProvider(create: (_) => ThemeStore()),
    ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final CurrentData currentData = CurrentData();
  final ThemeStore _themeStore = ThemeStore();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => currentData,
      child: Consumer<CurrentData>(
          builder: (context, provider, child) => OverlaySupport.global(
            child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Smart Cards',
                  locale: Provider.of<CurrentData>(context).locale,
                  // home: HomePage(),
                  localizationsDelegates: [
                    const AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    const Locale('en'),
                    const Locale('fa'),
                    const Locale('fr'),
                    const Locale('es'),
                    const Locale('ru'),
                  ],

              theme: _themeStore.darkMode ? themeDataDark : themeData,
                  // theme: ThemeData(
                  //     brightness: Brightness.dark,
                  //     primarySwatch: Colors.deepPurple,
                  //     fontFamily: 'IRANSans_medium'),
                  darkTheme: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.deepPurple,
                      fontFamily: 'IRANSans_medium'),
//      home:
//     MyApps(),
//      Home(),
                  initialRoute: '/',
                  onGenerateRoute: RouteGenerator.generateRoute,
                ),
          )),
    );
  }
}
