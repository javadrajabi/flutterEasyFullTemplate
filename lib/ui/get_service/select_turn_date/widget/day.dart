import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  final bool select;
  final Function onTop;
  final String title;
  final String subTitle;

  const DayWidget(
      {Key? key,
      required this.select,
      required this.title,
      required this.subTitle,
      required this.onTop})
      : super(key: key);

  @override
  _DayWidgetState createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTop();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        // height: 230,
        margin: EdgeInsets.all(5),
        // padding: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Text(widget.title),
            Text(widget.subTitle),
          ],
        ),

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.select
                    ? [Colors.blueAccent, Colors.lightBlueAccent]
                    : [Colors.black12, Colors.grey.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            // color:checked?Colors.blueGrey.shade200: Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(50.0),
                topRight: Radius.circular(8.0))),
      ),
    );
  }
}
