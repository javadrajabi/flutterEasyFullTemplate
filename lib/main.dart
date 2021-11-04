import 'package:loader_overlay/loader_overlay.dart';
import 'package:template/provider/chat_provider.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/provider/notifProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/ui/language.dart';
import 'config/themes/themesData.dart';
import 'data/local/datasources/LocalDB.dart';
import 'data/repository.dart';
import 'data/sharedpref/shared_preference_helper.dart';
import 'config/routes/route_generator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'provider/localization.dart';
import 'config/languages/localization/app_localization.dart';

// Future<void> backgroundHandler(RemoteMessage message) async{
//   print(message.data.toString());
//   print(message.notification!.title);
// }

void main() async {
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
    ChangeNotifierProvider(create: (_) => NotifP()),
    ChangeNotifierProvider(create: (_) => ChatP()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final LocalizationData currentData = LocalizationData();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: ChangeNotifierProvider(
        create: (context) => currentData,
        child: Consumer<LocalizationData>(
            builder: (context, provider, child) => MaterialApp(
                  navigatorKey: Repository.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'درنیکا',
                  locale: Provider.of<LocalizationData>(context).locale,
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

                  theme: Provider.of<LocalizationData>(context).darkMode
                      ? themeDataDark
                      : themeData,
                  // theme: ThemeData(
                  //     brightness: Brightness.dark,
                  //     primarySwatch: Colors.deepPurple,
                  //     fontFamily: 'IRANSans_medium'),
                  darkTheme: themeDataDark,
                  // home: Language(),
//     MyApps(),
//      Home(),
                  initialRoute: '/',

                  onGenerateRoute: RouteGenerator.generateRoute,
                )),
      ),
    );
  }
}
