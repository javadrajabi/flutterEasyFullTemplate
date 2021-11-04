import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_theme.dart';

class TurnView extends StatelessWidget {
  final List<Color> colors;
  final Widget child;
  final Color textColor;
  final TextAlign? textAlign;
  final Color? buttonTextColor;
  final String? buttonText;
  final Color? buttonColor;
  final Function? onPress;

  TurnView(
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


class HomeTurnView extends StatefulWidget {

  final String reserveDate;
  final String reqDate;
  final String subTitle;
  final String name;
  final String phone;
  final String address;
  final String time;


  const HomeTurnView({Key? key,
    required this.reserveDate,
    required this.reqDate,
    required this.subTitle,
    required this.name,
    required this.phone,
    required this.time,
    required this.address}) : super(key: key);

  @override
  _HomeTurnViewState createState() => _HomeTurnViewState();
}

class _HomeTurnViewState extends State<HomeTurnView> {

  getDayString(String date){
    if(date!=''){
      List spl=date.split('/');
      JalaliFormatter f=Jalali(int.parse(spl[0]),int.parse( spl[1]), int.parse(spl[2])).formatter;
      return '${f.wN}';
    }else{
      return'';
    }
  }

String jdateToString(String date){

    if(date!=''){
      List spl=date.split(' ')[0].split('/');
      JalaliFormatter f=Jalali(int.parse(spl[0]),int.parse( spl[1]), int.parse(spl[2])).formatter;
      return ' ${f.d} ${f.mN} ${f.yyyy}' + ' ساعت '+ " ${widget.time} ";
    }else{
      return'';
    }


}


  @override
  Widget build(BuildContext context) {
    return TurnView(
        colors: [
          FitnessAppTheme.nearlyBlue,
          FitnessAppTheme.nearlyDarkBlue
        ],
        textColor: Colors.red,
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       getDayString(widget.reserveDate) ,
                        style:
                        TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(jdateToString(widget.reserveDate),
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                      Text('  تاریخ ثبت : '+jdateToString(widget.reqDate),
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                      Text(widget.subTitle,
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/turnDetails');

                        },
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/logo1.png',
                      width: 40,
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      Text(widget.name,
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                      Text(widget.phone,
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                      Text(widget.address,
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      launch("tel://"+widget.phone);

                    },
                    icon: Icon(
                      Icons.call_rounded,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
