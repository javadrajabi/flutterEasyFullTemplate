// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:template/pages/home/tabs/house/dict/dict.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:flutter/material.dart';
import 'package:template/data/webService/requests/users.dart';
import 'tabs/house.dart';
import 'tabs/setting.dart';
import '../../widget/popUp/showQuestionMessage.dart';
import 'package:provider/provider.dart';
import '../../../provider/homeProvider.dart';

enum Tab { Home, Map, Setting }

class Home extends StatefulWidget {
  final setSelectedTab;

  Home({this.setSelectedTab});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.setSelectedTab ?? 0;
    // inizialaz();
  }

  Future<void> saveTokenToDatabase(String token) async {
    ApiUsers.sendDeviceToken(token);
  }

  // inizialaz() async{
  //
  //   await FirebaseMessaging.instance.getToken().then((value) {
  //     print('--------------------------TOKEN---------------');
  //     print(value);
  //     saveTokenToDatabase(value!);
  //   });
  //   FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  //
  //   // context.read<HomeP>().init();
  // }

  List tab = [
    House(),
    Dict(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (selectedTab == 0) {
            final res = await showQuestionMessage(
              context: context,
              text: 'آیا میخواهید از برنامه خارج شوید؟ ',
            );
            if (res == true) {
              return Future<bool>.value(true);
            } else {
              return Future<bool>.value(false);
            }
          } else {
            setState(() {
              selectedTab = 0;
            });

            return Future<bool>.value(false);
          }
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: MyColors.cyan,
          // appBar: PreferredSize(
          //     child: Container(),
          //     preferredSize: Size.fromHeight(0)
          // ),
          appBar:selectedTab != 1? AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: MyColors.cyan,
            actions: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/notification');
                      },
                      icon: Icon(MyIcon.notification)),
                  if (context.watch<HomeP>().notificationCount > 0)
                    Container(
                      alignment: Alignment.center,
                      height: 15,
                      width: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          context.watch<HomeP>().notificationCount.toString(),
                          style: TextStyle(fontSize: 8, color: Colors.white),
                        ),
                      ),
                    )
                ],
              )
            ],
            leading: IconButton(
              onPressed: () {
                // LocalShP.remove('userData');
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil('/login', (route) => false);
                // launch(
                //   'https://vesga.ir',
                // );
              },
              icon: Icon(MyIcon.setting),
            ),
          ):AppBar(toolbarHeight: 0,backgroundColor: MyColors.cyan,),
          bottomNavigationBar: Container(
            // padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            // width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    icon: Icon(
                      selectedTab == 0 ? MyIcon.home_bold : MyIcon.home,
                      color: selectedTab == 0 ? MyColors.amber : Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },
                    icon: Icon(
                        selectedTab == 1
                            ? Icons.label
                            : Icons.map_outlined,
                        color:
                            selectedTab == 1 ? MyColors.amber : Colors.white)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedTab = 2;
                      });
                    },
                    icon: Icon(
                        Icons.menu_book,
                        color:
                            selectedTab == 2 ? MyColors.amber : Colors.white)),
              ],
            ),
          ),
          body: tab[selectedTab],
        ));
  }
}
