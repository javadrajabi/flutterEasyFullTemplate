import 'dart:math';

import 'package:template/config/themes/my_drawing.dart';

import '../../../config/config.dart';
import 'package:flutter/material.dart';

Future showResetQuestion({required context, required text, title}) async {
  title = title ?? '';
  random(min, max){
    var rn = Random();
    return min + rn.nextInt(max - min);
  }
  int rand=random(1000,2000);
  TextEditingController ctr=TextEditingController();
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "برای اطمینان عدد " + rand.toString() + " را در باکس پایین وارد نمایید",
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
                        hintText: '****',
                        counter: Offstage(),
                        contentPadding:
                        EdgeInsets.only(left: 14.0,right: 10),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          child: Text(" بله ",
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
                            print([rand.toString() , ctr.text]);
                            if(rand.toString() == ctr.text){
                              Navigator.of(context).pop(true);
                            }

                          }),
                      TextButton(
                          child: Text(" خیر ", style: TextStyle(fontSize: 12)),
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
