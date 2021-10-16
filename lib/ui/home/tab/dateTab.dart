import 'package:flutter/material.dart';
import 'package:template/ui/home/component/workOut.dart';

import '../../app_theme.dart';

class DateTab extends StatefulWidget {
  const DateTab({Key? key}) : super(key: key);

  @override
  _DateTabState createState() => _DateTabState();
}

class _DateTabState extends State<DateTab> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: TabBar(indicatorColor: Colors.blue,
          onTap: (x) {
            print('11111111111------$x');
            setState(() {
              _currentIndex = x;
            });
          },
          tabs: [
            Tab(
              icon: Text(
                'نوبت های آینده',
                style: TextStyle(
                    color: _currentIndex == 0 ? Colors.blue : Colors.grey),
              ),
            ),
            Tab(
                icon: Text(
              'تاریخچه',
              style: TextStyle(
                  color: _currentIndex == 1 ? Colors.blue : Colors.grey),
            )),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(
                child: Text('اطلاعاتی وجود ندارد.',
                    style: TextStyle(color: Colors.grey))),
            Center(
                child: Text(
              'اطلاعاتی وجود ندارد.',
              style: TextStyle(color: Colors.grey),
            )),
          ],
        ),
      ),
    );

    //   SingleChildScrollView(
    //   child: Column(
    //       children: [
    //         WorkoutView(
    //             colors: [FitnessAppTheme.orange, FitnessAppTheme.nearlyOrange],
    //             child: Text(
    //               'لطفا برای استفاده بهتر از خدمات اپلیکیشن پروفایل خود را تکمیل کنید.',
    //               // textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontFamily: FitnessAppTheme.fontName,
    //                 fontWeight: FontWeight.normal,
    //                 fontSize: 14,
    //                 letterSpacing: 0.0,
    //                 color: FitnessAppTheme.white,
    //               ),
    //             ),
    //             buttonText: 'تکمیل پروفایل',
    //             textColor: FitnessAppTheme.white,
    //             buttonColor: FitnessAppTheme.white,
    //             onPress: () {
    //               print('111111111111111111111111');
    //             }),
    //         Card(margin: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 9),
    //           child: Row(
    //             children: [
    //               ClipRRect(
    //                 child: Image.asset(
    //                   'assets/logo1.png',
    //                   width: 40,
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 30,
    //               ),
    //               Text('09357586173')
    //             ],
    //           ),
    //         ),
    //         WorkoutView(
    //           textAlign: TextAlign.center,
    //           colors: [
    //             FitnessAppTheme.nearlyBlue,
    //             FitnessAppTheme.nearlyDarkBlue
    //           ],
    //
    //           child: SizedBox(
    //             height: 100,
    //             child: Center(
    //               child: Text(
    //                 'اطلاعاتی وجود ندارد.',
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   fontFamily: FitnessAppTheme.fontName,
    //                   fontWeight: FontWeight.normal,
    //                   fontSize: 14,
    //                   letterSpacing: 0.0,
    //                   color: FitnessAppTheme.white,
    //                 ),
    //               ),
    //             ),
    //           ),
    //
    //           textColor: FitnessAppTheme.white,
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 9),
    //           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text("اعلامیه های اخیر",style: TextStyle(color:FitnessAppTheme.darkPurple ),),
    //               TextButton(onPressed: () {  },
    //                 child: Text("نمایش همه",style: TextStyle(color:Colors.blue)),),
    //
    //             ],),
    //         ),
    //         Center(
    //           child:
    //           Text("اعلامیه ای وجود ندارد",style: TextStyle(fontSize: 14,color:FitnessAppTheme.grey ),),
    //         ),]),
    // );
  }
}
