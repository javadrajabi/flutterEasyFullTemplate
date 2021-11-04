import 'package:flutter/material.dart';
import 'package:template/ui/widgets/buttons.dart';

class DatePickerContent extends StatefulWidget {


  const DatePickerContent({Key? key}) : super(key: key);

  @override
  _DatePickerContentState createState() => _DatePickerContentState();
}
String name='',famili='';
class _DatePickerContentState extends State<DatePickerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        TextField(
          // autofocus: true,
          decoration: InputDecoration(
            // border: OutlineInputBorder(),
            hintText: 'نام خانوادگی خود را وارد کنید',
            labelText: 'نام:',
            hintStyle: TextStyle(fontSize: 12),
            labelStyle: TextStyle(fontSize: 18,color: Colors.blueGrey),
          ),
          onChanged: (s){
            name=s;
          },
        ),
        TextField(
          // autofocus: true,
          decoration: InputDecoration(
            // border: OutlineInputBorder(),
            hintText: 'نام خانوادگی خود را وارد کنید',
            labelText: 'نام خانوادگی:',
            hintStyle: TextStyle(fontSize: 12),
            labelStyle: TextStyle(fontSize: 18,color: Colors.blueGrey),
          ),
          onChanged: (s){
            famili=s;
          },
        ),
        SizedBox(height: 20,),
        RadiusButton(
          selected: false,
          width: 100,
          buttonColors: [Colors.green, Colors.green.shade800],
          onTop: () {
            Navigator.of(context).pop({"fname":famili ,"lname":name});
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(' تایید  ',style: TextStyle(color: Colors.white),),
            ),
          ),
        )
      ],

      ),
    );
  }
}
