import 'package:flutter/material.dart';
import 'package:template/ui/home/component/workOut.dart';

import '../../../app_theme.dart';
class NofifCard extends StatefulWidget {
  final String text;
  final String date;

  const NofifCard({Key? key,required this.text,required this.date}) : super(key: key);

  @override
  _NofifCardState createState() => _NofifCardState();
}

class _NofifCardState extends State<NofifCard> {
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: WorkoutView(
              textAlign: TextAlign.center,
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade500,
              ],
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.text,
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                     widget.date.toString().split('T')[1].split('.')[0]+' '+widget.date.toString().split('T')[0],
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              textColor: FitnessAppTheme.white,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          ),
        ],
      )
    ;
  }
}
