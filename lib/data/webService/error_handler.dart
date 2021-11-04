import 'dart:convert';

import 'package:flutter/material.dart';

import '../repository.dart';
import 'package:http/http.dart';

class ErrorHandler {
  static analize(Response body) {
    // Repository.context=context;
    _showMyDialog(jsonDecode(body.body));
    print(body);
  }

  static Future<void> _showMyDialog(Map body) async {
    showDialog<void>(
      context: Repository.navigatorKey.currentContext!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اخطار'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('This is a demo alert dialog.'),
                for (int i = 0; i < body['error'].length; i++)
                  Text(body['error'][body['error'].keys.elementAt(i)][0]),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('تایید'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
