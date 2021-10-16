import 'package:template/config/themes/my_drawing.dart';

import '../../../config/config.dart';
import 'package:flutter/material.dart';


Future showQuestionMessage({required context, required text, title,String? yes,String? no}) async {
    title = title ?? '';
  return  await showDialog(
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
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(text,style: TextStyle(fontSize: 14),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            child: Text(
                              yes??" بله ",
                              style: TextStyle(color: MyColors.cyan,fontSize: 12)
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(MyColors.amber),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),

                                        side: BorderSide(color: MyColors.amber)
                                    )
                                )
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            }),
                        TextButton(
                            child: Text(
                             no ?? " خیر ",
                                style: TextStyle(fontSize: 12)
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsets>(EdgeInsets.all(8)),
                                foregroundColor:
                                MaterialStateProperty.all<
                                    Color>(MyColors.amber),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        side: BorderSide(color: MyColors.amber)))),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            }),

                      ],
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

