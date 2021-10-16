import 'dart:math';

import 'package:template/config/themes/my_drawing.dart';

import '../../../config/config.dart';
import 'package:flutter/material.dart';

Future showAlertMessage({required context, required text}) async {

 return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: MyColors.cyan,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          child: Text(" متوجه شدم ",
                              style: TextStyle(
                                  color: MyColors.cyan, fontSize: 12)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.amber),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side:
                                          BorderSide(color: MyColors.amber)))),
                          onPressed: () {
                              Navigator.of(context).pop();
                          }),

                    ],
                  ),

                ],
              ),
            ),
          );
        });
      });
}
