import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:template/Utils/encryption/AesEncryption.dart';
import 'package:template/Utils/encryption/aes_encryption_helper.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
    _runAnimation();
  }

  void _runAnimation() async {
    for (int i = 0; i < 5; i++) {
      if (this.mounted) {
        await _animationController.forward();
        await _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // super.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
        'دکتر اپ',
        style: TextStyle(color: Colors.blue),
      )),
      actions: [
        IconButton(
            onPressed: () {
            String ss=  AesEncryption.encrypt('{"sa":"dkjhf","id":2}' );
           // Map as= jsonDecode(ss);
            print(ss);
            },
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.blue,
            ))
      ],
      leading: IconButton(
          onPressed: () {
              Navigator.of(context).pushNamed('/notifList');
          },
          icon: Stack(
            alignment: Alignment.topLeft,
            children: [
               RotationTransition(
                  turns: Tween(begin: 0.0, end: -.1)
                      .chain(CurveTween(curve: Curves.elasticIn))
                      .animate(_animationController),
                  child: Icon(Icons.notifications_none, color: Colors.blue),
                ),

              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Text(
                  '2',
                  style: TextStyle(fontSize: 10),
                )),
              )
            ],
          )),
    );
  }
}
