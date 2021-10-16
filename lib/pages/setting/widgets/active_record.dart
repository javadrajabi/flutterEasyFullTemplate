import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/widget/popUp/showRenameQuestion.dart';

class ActiveRecord extends StatefulWidget {
  String title;
  Function onClose;
  bool sColor;

  ActiveRecord(
      {Key? key,
        required this.title,
        required this.onClose,
      required this.sColor
      })
      : super(key: key);

  @override
  _DeviceRecordState createState() => _DeviceRecordState();
}

class _DeviceRecordState extends State<ActiveRecord> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      // width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color:widget.sColor?MyColors.primaryDark: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
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
            widget.title+(widget.sColor?' |شما| ':''),
            style: TextStyle(color: MyColors.gray),
          ),
          widget.sColor?SizedBox(): InkWell(child: Icon(Icons.close,color: Colors.red,),onTap:() {
            widget.onClose();
          }
          ),
        ],
      ),
    );
  }
}
