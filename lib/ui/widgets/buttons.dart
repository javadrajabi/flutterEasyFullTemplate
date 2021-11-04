import 'package:flutter/material.dart';

class RadiusButton extends StatelessWidget {
  final Widget child;
  final Function onTop;
  final bool? selected;
  final bool? selectAble;
  final double? width;
  final List<Color>? buttonColors;

  const RadiusButton(
      {Key? key,
      required this.child,
      this.buttonColors,
      required this.onTop,
      this.selected,
      this.selectAble,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(selectAble??true){
          this.onTop();
        }else{

        }

      },
      child: Container(
        width:this.width,
        // height: 230,
        margin: EdgeInsets.all(5),
        // padding: EdgeInsets.only(right: 10),
        child: this.child,

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: selectAble!=false?(this.selected == true
                    ? [Colors.green, Colors.greenAccent]
                    : (buttonColors ??
                        [Colors.grey.shade200, Colors.grey.shade100])):[Colors.red.shade200, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            // color:checked?Colors.blueGrey.shade200: Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(40.0),
                topRight: Radius.circular(8.0))),
      ),
    );
  }
}
