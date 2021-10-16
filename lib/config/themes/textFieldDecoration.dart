import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_drawing.dart';

class InputDecorations {


  static InputDecoration template1({hintText}) {
    hintText=hintText??'';
    return InputDecoration(
      fillColor: MyColors.gray,
      // icon: Icon(Icons.send),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),),
      // helperText: 'شماره تماس',
      // counterText: '0 characters',
      // border: OutlineInputBorder(),
    );
  }


}


