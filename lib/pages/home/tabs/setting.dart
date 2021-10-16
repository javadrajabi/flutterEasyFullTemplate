import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:provider/provider.dart';
import 'package:template/data/sharedpref/shared_preference_helper.dart';
import 'package:template/pages/setting/widgets/setting_item.dart';
import 'package:template/widget/custom_switch.dart';
import 'package:template/widget/overlayContainer/overlay_container.dart';
import 'package:template/widget/popUp/showEditThree.dart';
import 'package:template/widget/switch/custom_switch.dart';
import '../../../provider/homeProvider.dart';

// import '../../../widget/speedMeter/flutter_speedometer.dart';
import '../../../widget/syncfusion_flutter_gauges/gauges.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {


 bool isSwitched=true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SettingItem(
            title: "شارژ  سیمکارت : " + (context.watch<HomeP>().lastState?.credit?.toString() ?? '?') +' ريال ',
            type:ItemType.Normal ,
            onTap: (val){
            }),
        SettingItem(
            title: "مدیریت دستگاه ها" ,
            type:ItemType.More ,
            onTap: (val){
              Navigator.of(context).pushNamed('/devices');
            }),
        SettingItem(
            title: "تنظیمات دستگاه" ,
            type:ItemType.More ,
            onTap: (val){
              Navigator.of(context).pushNamed('/deviceSetting');
            }),
        SettingItem(
            title: "اعلانات دستگاه" ,
            type:ItemType.More ,
            onTap: (val){
              Navigator.of(context).pushNamed('/alertSetting');
            }),
        SettingItem(
            title: "اعلانات پیامکی" ,
            type:ItemType.More ,
            onTap: (val){
              Navigator.of(context).pushNamed('/smsAlertSetting');
            }),

        SettingItem(
            title: "کاربران فعال برای این دستگاه" ,
            type:ItemType.More ,
            onTap: (val){
              Navigator.of(context).pushNamed('/activeSession');
            }),
        SettingItem(
            title: "رمز ورود به نرم افزار" ,
            type:ItemType.Normal ,
            onTap: (val)async {
             final pass=await showEditThree(context:context,text: 'رمز مورد نظر خود برای ورود به این برنامه را وارد نمایید.', hint: 'رمز' );
              if(pass!=null){
                if(pass=='L'){
                  SharedPreferenceHelper.removePassword();
                }else{
                  SharedPreferenceHelper.setPassword(pass);
                }

              }

            }),


        SettingItem(
                title: "راهنما دستورات پیامکی" ,
            type:ItemType.Normal ,
            onTap: (val){
            }),
        SettingItem(
            title: "اطلاعات دستگاه" ,
            type:ItemType.Normal ,
            onTap: (val){
            }),
        SettingItem(
            title: "درباره ی ما" ,
            type:ItemType.Normal ,
            onTap: (val){
            }),

      ],),
    );
  }
}
