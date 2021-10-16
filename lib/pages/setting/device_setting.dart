import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:provider/provider.dart';
import 'package:template/pages/setting/widgets/setting_item.dart';
import 'package:template/data/webService/requests/status-api.dart';
import 'package:template/widget/custom_switch.dart';
import 'package:template/widget/overlayContainer/overlay_container.dart';
import 'package:template/widget/popUp/showEditQuestion.dart';
import 'package:template/widget/popUp/showQuestionMessage.dart';
import 'package:template/widget/switch/custom_switch.dart';
import '../../../provider/homeProvider.dart';

// import '../../../widget/speedMeter/flutter_speedometer.dart';
import '../../../widget/syncfusion_flutter_gauges/gauges.dart';

class DeviceSetting extends StatefulWidget {
  @override
  _DeviceSettingState createState() => _DeviceSettingState();
}

class _DeviceSettingState extends State<DeviceSetting> {


  bool isSwitched=true;
  int selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false,arguments: 2);
          return false;
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: MyColors.cyan,
          // appBar: PreferredSize(
          //     child: Container(),
          //     preferredSize: Size.fromHeight(0)
          // ),
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: MyColors.cyan,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(MyIcon.notification)),
            ],
            title: Text('تنظیمات دستگاه',style: TextStyle(color: MyColors.gray,fontSize: 18),),
            leading:
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          bottomNavigationBar: Container(
            // padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            // width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false,arguments: 0);
                    },
                    icon: Icon(
                      selectedTab == 0 ? MyIcon.home_bold : MyIcon.home,
                      color: selectedTab == 0 ? MyColors.amber : Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false,arguments: 1);
                    },
                    icon: Icon(
                        selectedTab == 1
                            ? Icons.map_rounded
                            : Icons.map_outlined,
                        color:
                        selectedTab == 1 ? MyColors.amber : Colors.white)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false,arguments: 2);
                    },
                    icon: Icon(
                        selectedTab == 2 ? MyIcon.setting_bold : MyIcon.setting,
                        color:
                        selectedTab == 2 ? MyColors.amber : Colors.white)),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SettingItem(
                  title: "تنظیم سرعت مجاز" ,
                  type:ItemType.Normal ,
                  onTap: (val)async{
                  final speed=await  showEditQuestion(context: context,text:'زمانی که سرعت از این مقدار بیشتر گردد به شما اعلام خواهد شد.' ,name: context.read<HomeP>().selectedImei!.max_speed.toString());
                  ApiStatus.appNotificationSetting(
                      imei: context.read<HomeP>().selectedImei!.imei!,
                      text: 'ms=',
                  speed:speed?.toString()??'120'
                  ).then((value){
                    Provider.of<HomeP>(context, listen: false).selectedImei=value;
                  });
                  }),
              // SettingItem(
              //     title: "تنظیم رمز ورود به نرم افزار" ,
              //     type:ItemType.Switch ,
              //     onTap: (val){
              //     }),
              // SettingItem(
              //     title: "رمز دستگاه" ,
              //     type:ItemType.Switch ,
              //     onTap: (val){
              //     }),
              SettingItem(
                  title: "تنظیم بازه زمانی ارسال موقعیت" ,
                  type:ItemType.Normal ,
                  onTap: (val)async{
                    final speed=await  showEditQuestion(context: context,text:'فاصله زمانی بین ارسال اطلاعات از دستگاه به سرور.(حداقل 6 ثانیه)' ,name: '10');
                    int speedI=int.parse(speed);
                    if(speedI>5){

                      ApiStatus.appNotificationSetting(
                          imei: context.read<HomeP>().selectedImei!.imei!,
                          text: 'tsp=',
                          speed:speed?.toString()
                      );
                    }
                  }),
              // SettingItem(
              //     title: "تنظیم تن پیامک" ,
              //     type:ItemType.Switch ,
              //     onTap: (val){
              //     }),

            ],),
          ),
        ));
  }



}
