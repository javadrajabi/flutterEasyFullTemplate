import 'package:flutter/material.dart';

class ServiceRecord extends StatefulWidget {
  final String text;
  final String title;
  final Function onTop;
  const ServiceRecord({Key? key,required this.text,required this.onTop,required this.title}) : super(key: key);

  @override
  _ServiceRecordState createState() => _ServiceRecordState();
}

class _ServiceRecordState extends State<ServiceRecord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 230,
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      padding: EdgeInsets.only(right: 10),
      child:
      ListTile(

        onTap: (){
          widget.onTop();
        },
        //   Navigator.of(context).pushNamed('/selectTurnDate');
        // },
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: Image.asset(
          'assets/logo1.png',
          width: 45,
        ),
        subtitle: Text(widget.text,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black12, Colors.grey.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          // color:checked?Colors.blueGrey.shade200: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(50.0),
              topRight: Radius.circular(8.0))),
    );
  }
}
