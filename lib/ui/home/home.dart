import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/Utils/device/device_utils.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/ui/getTurn/get_turn.dart';
import 'package:template/ui/getTurn/get_turn_AppBar.dart';
import 'package:template/ui/home/tab/setting.dart';
import 'package:template/ui/home/tab/chatTab.dart';
import 'package:template/ui/home/tab/dateTab.dart';
import 'package:template/ui/home/tab/homeTab.dart';
import 'package:template/widget/widgets/animated-bottom-navigation-bar/animated_bottom_navigation_bar.dart';
import 'component/appBar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  getTabItems() {
    _tabItems=  <Widget>[
      HomeTab(
        changeTabIndex: (i) {
          print('HHHHHHHHHHHHHHHHHHHHHHHHH');
          setState(() {
            _bottomNavIndex = i;
          });
        },
      ),
      DateTab(),
      ChatApp(),
      Setting(),
      GetTurn(),
    ];
  }

  late final List<Widget> _tabItems ;
  final _iconList = <IconData>[
    Icons.home_filled,
    Icons.calendar_today_rounded,
    Icons.message,
    Icons.settings,
  ];

  @override
  void initState() {
    super.initState();
    getTabItems();
    _animationController = AnimationController(
      duration: Duration(seconds: 0),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  PreferredSizeWidget? _showAppBarWidget(index) {
    if (index == 2) {
      return null;
    } else if (index == 4) {
      return GetTurnAppBar(
        onClose: () {
          setState(() {
            _bottomNavIndex = 0;
          });
        },
        onTextSearch: (s) {
          print(s);
          context.read<HomeP>().filterServiceByString(s);
        },
      );
    } else {
      return HomeAppBar();
    }
    // _bottomNavIndex=4;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_bottomNavIndex != 0) {
          setState(() {
            _bottomNavIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: _showAppBarWidget(_bottomNavIndex),

        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            // 1.
            final offsetAnimation = Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation);
            // 3.
            return ClipRect(
              // 2.
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );
          },
          child: _tabItems[_bottomNavIndex],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn11",
          elevation: 8,
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _bottomNavIndex = 4;
            });
            _animationController.reset();
            _animationController.forward();
          },
        ),
        //destination screen
        //params

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: _iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.blue : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _iconList[index],
                  size: 24,
                  color: color,
                ),
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: _bottomNavIndex,
          splashColor: Colors.blueGrey,
          // notchAndCornersAnimation: animation,
          // splashSpeedInMilliseconds: 300,
          // notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 10,
          rightCornerRadius: 10,

          notchSmoothness: NotchSmoothness.smoothEdge,
          onTap: (index) {
            print(index);
            setState(() => _bottomNavIndex = index);
          },
        ),
      ),
    );
  }
}
