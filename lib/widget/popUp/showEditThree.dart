import 'dart:math';

import 'package:template/config/themes/my_drawing.dart';

import '../../../config/config.dart';
import 'package:flutter/material.dart';

Future showEditThree({required context, required text,required String hint}) async {


  TextEditingController ctr=TextEditingController();
  // ctr.text=name;
 return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: MyColors.cyan,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               title: Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   // fontSize: 22.0,
// //                        fontFamily: 'helvetica_neue_light',
//                 ),
//                 textAlign: TextAlign.center,
//               ),
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
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    // padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      autofocus: false,
                      maxLength: 11,
                      controller: ctr,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 22.0, color: MyColors.gray),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.cyanLite,
                        hintText:hint,
                        counter: Offstage(),
                        contentPadding:
                        const EdgeInsets.only(left: 14.0,right: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.cyanLite),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.cyanLite),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                        TextButton(
                            child: Text(" فعال سازی ",
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

                              print('showEditQuestion+++++++++++++++++++++++++++++'+ctr.text);
                              Navigator.of(context).pop(ctr.text);


                            }),
                        TextButton(
                            child: Text(" غیر فعال سازی ", style: TextStyle(fontSize: 12)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(8)),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    MyColors.amber),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side:
                                        BorderSide(color: MyColors.amber)))),
                            onPressed: () {
                              Navigator.of(context).pop('L');
                            }),
                      ],),
                      TextButton(
                          child: Text(" لغو ", style: TextStyle(fontSize: 12)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(8)),
                              foregroundColor: MaterialStateProperty.all<Color>(
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
