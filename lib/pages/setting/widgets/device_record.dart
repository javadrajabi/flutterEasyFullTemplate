import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/widget/popUp/showRenameQuestion.dart';

class DeviceRecord extends StatefulWidget {
  String title;
  Function onReset;
  Function onRename;

  DeviceRecord(
      {Key? key,
      required this.title,
      required this.onReset,
      required this.onRename})
      : super(key: key);

  @override
  _DeviceRecordState createState() => _DeviceRecordState();
}

class _DeviceRecordState extends State<DeviceRecord> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        // width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: MyColors.gray),
            ),
            Row(children: [

              InkWell(child: Icon(MyIcon.edit),onTap:()async{

                  widget.onRename();

              },),
              SizedBox(width:20 ,),
              InkWell(child: Icon(Icons.refresh,color: Colors.red,),onTap:() {
                 widget.onReset();
               }

              ),

            ],)
          ],
        ),
      );
  }
}
