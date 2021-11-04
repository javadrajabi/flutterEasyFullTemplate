import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import 'day.dart';

class SelectDay extends StatefulWidget {
  final Jalali date;
  final Function(Jalali) onTop;
  const SelectDay({Key? key,required this.date,required this.onTop}) : super(key: key);

  @override
  _SelectDayState createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay> {
  int _selectId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 230,
      margin: EdgeInsets.all(5),
      // padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DayWidget(
            title: widget.date==Jalali.now()?'امروز':widget.date.formatter.wN,
            subTitle: widget.date.formatter.dd +' '+widget.date.formatter.mN,
            onTop: () {

              widget.onTop(widget.date);
              setState(() {
                _selectId = 0;
              });
            },
            select: _selectId==0,
          ),
          DayWidget(
            title: widget.date.addDays(1).formatter.wN,
            subTitle: widget.date.addDays(1).formatter.dd+' '+widget.date.addDays(2).formatter.mN,
            onTop: () {


              widget.onTop(widget.date.addDays(1));
              setState(() {
                _selectId = 1;
              });
            },
            select: _selectId==1,
          ),
          DayWidget(
            title: widget.date.addDays(2).formatter.wN,
            subTitle: widget.date.addDays(2).formatter.dd+' '+widget.date.addDays(2).formatter.mN,
            onTop: () {
              widget.onTop(widget.date.addDays(2));
              setState(() {
                _selectId = 2;
              });
            },
            select: _selectId==2,
          ),
        ],
      ),

      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey.shade200, Colors.grey.shade100],
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
