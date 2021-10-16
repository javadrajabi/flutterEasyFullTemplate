import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:template/ui/home/tab/setting.dart';
import 'package:template/ui/home/tab/chatTab.dart';
import 'package:template/ui/home/tab/dateTab.dart';
import 'package:template/ui/home/tab/homeTab.dart';
import 'package:template/widget/widgets/animated-bottom-navigation-bar/animated_bottom_navigation_bar.dart';
import '../app_theme.dart';
import 'bottomNavBar.dart';
import 'component/appBar.dart';
import 'component/workOut.dart';

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

  final _tabItems = <Widget>[
    HomeTab(),
    DateTab(),
    ChatApp(),
    Setting(),
  ];
  final _iconList = <IconData>[
    Icons.home_filled,
    Icons.calendar_today_rounded,
    Icons.message,
    Icons.settings,
  ];
  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:_bottomNavIndex==2?null: HomeAppBar(),

      body:AnimatedSwitcher(
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

        elevation: 8,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
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
        } ,
      ),
    );
  }
}







class FixedCenterDockedFabLocation extends FloatingActionButtonLocation {
  const FixedCenterDockedFabLocation({
    this.context,
  });
  final context;

  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;
    double bottomDistance = MediaQuery.of(context).viewInsets.bottom;

    double fabY = contentBottom + bottomDistance - fabHeight / 2.0;

    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0)
      fabY = min(fabY, contentBottom - snackBarHeight - fabHeight - kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY = min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return min(maxFabY, fabY);
  }
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width) / 2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }
}