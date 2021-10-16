import 'package:flutter/material.dart';
import '../config/themes/my_drawing.dart';

class CommonAppBar {
  static Widget getPrimaryAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: MyColors.primary,
      title: Text(title,),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {Navigator.pop(context);},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showToastClicked(context, "Seach");
          },
        ),
      ]
    );
  }

  static Widget getPrimarySettingAppbar(BuildContext context, String title){
    return AppBar(
        backgroundColor: MyColors.primary,
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Seach");
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value){
              showToastClicked(context, value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Settings", child: Text("Settings"),
              ),
            ],
          )
        ]
    );
  }

  static Widget getPrimaryBackAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: MyColors.primary,
      title: Text(title,),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showToastClicked(context, "Seach");
          },
      ),
    ]
    );
  }


  static void showToastClicked(BuildContext context, String action){
    print(action);
    // Toast.show(action+" clicked", context);
  }
}
