import 'package:flutter/material.dart';


class HomeAppBar extends StatefulWidget with PreferredSizeWidget{
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // foregroundColor: Colors.white,
      backgroundColor:  Colors.white,
title: Center(child: Text('دکتر اپ',style: TextStyle(color: Colors.blue),)),
      actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined,color: Colors.blue,))
    ],
      leading:IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: Colors.blue)),
    );
  }
}
