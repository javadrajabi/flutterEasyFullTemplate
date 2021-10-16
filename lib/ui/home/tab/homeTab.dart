import 'package:flutter/material.dart';
import 'package:template/ui/home/component/workOut.dart';

import '../../app_theme.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            WorkoutView(
                colors: [FitnessAppTheme.orange, FitnessAppTheme.nearlyOrange],
                child: Text(
                  'لطفا برای استفاده بهتر از خدمات اپلیکیشن پروفایل خود را تکمیل کنید.',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    letterSpacing: 0.0,
                    color: FitnessAppTheme.white,
                  ),
                ),
                buttonText: 'تکمیل پروفایل',
                textColor: FitnessAppTheme.white,
                buttonColor: FitnessAppTheme.white,
                onPress: () {
                  print('111111111111111111111111');
                }),
            Card(margin: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 9),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/logo1.png',
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('09357586173')
                ],
              ),
            ),
            WorkoutView(
              textAlign: TextAlign.center,
              colors: [
                FitnessAppTheme.nearlyBlue,
                FitnessAppTheme.nearlyDarkBlue
              ],

              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'اطلاعاتی وجود ندارد.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      letterSpacing: 0.0,
                      color: FitnessAppTheme.white,
                    ),
                  ),
                ),
              ),

              textColor: FitnessAppTheme.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 9),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("اعلامیه های اخیر",style: TextStyle(color:FitnessAppTheme.darkPurple ),),
                  TextButton(onPressed: () {  },
                    child: Text("نمایش همه",style: TextStyle(color:Colors.blue)),),

                ],),
            ),
            Center(
              child:
              Text("اعلامیه ای وجود ندارد",style: TextStyle(fontSize: 14,color:FitnessAppTheme.grey ),),
            ),]),
    );
  }
}
