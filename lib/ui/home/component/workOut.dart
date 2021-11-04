import 'package:flutter/material.dart';

import '../../app_theme.dart';

class WorkoutView extends StatelessWidget {
  final List<Color> colors;
  final Widget child;
  final Color textColor;
  final TextAlign? textAlign;
  final Color? buttonTextColor;
  final String? buttonText;
  final Color? buttonColor;
  final Function? onPress;

  WorkoutView(
      {Key? key, required this.colors,this.textAlign, this.onPress, required this.child,required this.textColor,this.buttonTextColor, this.buttonText, this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(8.0)),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //       color: FitnessAppTheme.grey.withOpacity(0.6),
        //       offset: const Offset(1.1, 1.1),
        //       blurRadius: 10.0),
        // ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.longestSide,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            child,
            // const Padding(
            //   padding: EdgeInsets.only(top: 8.0),
            //   child: Text(
            //     'سلام با مرام',
            //     // textAlign: TextAlign.left,
            //     style: TextStyle(
            //       fontFamily: FitnessAppTheme.fontName,
            //       fontWeight: FontWeight.normal,
            //       fontSize: 20,
            //       letterSpacing: 0.0,
            //       color: FitnessAppTheme.white,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            if (this.buttonText != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:this.buttonColor?? Colors.white,
                    // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        // fontSize: 30,
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  this.onPress!();

                },
                child: Text(
                  this.buttonText!,
                  style: TextStyle(color:this.buttonTextColor?? FitnessAppTheme.orange),
                ),
              )
            // Padding(
            //   padding: const EdgeInsets.only(right: 4),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       const Padding(
            //         padding: EdgeInsets.only(left: 4),
            //         child: Icon(
            //           Icons.timer,
            //           color: FitnessAppTheme.white,
            //           size: 16,
            //         ),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.only(left: 4.0),
            //         child: Text(
            //           '68 min',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontFamily: FitnessAppTheme.fontName,
            //             fontWeight: FontWeight.w500,
            //             fontSize: 14,
            //             letterSpacing: 0.0,
            //             color: FitnessAppTheme.white,
            //           ),
            //         ),
            //       ),
            //       const Expanded(child: SizedBox()),
            //       Container(
            //         decoration: BoxDecoration(
            //           color: FitnessAppTheme.nearlyWhite,
            //           shape: BoxShape.circle,
            //           boxShadow: <BoxShadow>[
            //             BoxShadow(
            //                 color: FitnessAppTheme.nearlyBlack
            //                     .withOpacity(0.4),
            //                 offset: const Offset(8.0, 8.0),
            //                 blurRadius: 8.0),
            //           ],
            //         ),
            //         child: const Padding(
            //           padding: EdgeInsets.all(0.0),
            //           child: Icon(
            //             Icons.arrow_right,
            //             color: Color(0xFF6F56E8),
            //             size: 44,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
