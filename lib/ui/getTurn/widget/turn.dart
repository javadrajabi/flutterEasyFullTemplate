import 'package:flutter/material.dart';

class Turn extends StatefulWidget {
  final bool isLeft;
  final String name;
  final Function(bool) onChange;

  const Turn(
      {Key? key,
      required this.name,
      required this.isLeft,
      required this.onChange})
      : super(key: key);

  @override
  _TurnState createState() => _TurnState();
}

class _TurnState extends State<Turn> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment:widget.isLeft? Alignment.topRight:Alignment.topLeft,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              checked = !checked;
              widget.onChange(checked);
            });
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            padding: EdgeInsets.all(5),
            // alignment: Alignment.center,
            child:
                // Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // children: [
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset('assets/logo1.png',width: 35,),
                //   ),
                Center(
                    child: Text(
              widget.name,
              style: TextStyle(color: checked ? Colors.white : Colors.black),
            )),
            //   ],
            // ),

            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: checked
                        ? [Colors.indigo.shade700, Colors.blue.shade700]
                        : [Colors.blue.shade100, Colors.black12],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                // color:checked?Colors.blueGrey.shade200: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(8.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo1.png',
            width: 35,
          ),
        ),
      ],
    );
  }
}
