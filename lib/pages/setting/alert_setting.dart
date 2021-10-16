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
import 'package:template/widget/popUp/showQuestionMessage.dart';
import 'package:template/widget/switch/custom_switch.dart';
import '../../../provider/homeProvider.dart';

// import '../../../widget/speedMeter/flutter_speedometer.dart';
import '../../../widget/syncfusion_flutter_gauges/gauges.dart';

class AlertSetting extends StatefulWidget {
  @override
  _AlertSettingState createState() => _AlertSettingState();
}

class _AlertSettingState extends State<AlertSetting> {
  bool isSwitched = true;
  int selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false, arguments: 2);
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
            title: Text(
              'اعلانات دستگاه',
              style: TextStyle(color: MyColors.gray, fontSize: 18),
            ),
            leading: IconButton(
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (route) => false,
                          arguments: 0);
                    },
                    icon: Icon(
                      selectedTab == 0 ? MyIcon.home_bold : MyIcon.home,
                      color: selectedTab == 0 ? MyColors.amber : Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (route) => false,
                          arguments: 1);
                    },
                    icon: Icon(
                        selectedTab == 1
                            ? Icons.map_rounded
                            : Icons.map_outlined,
                        color:
                            selectedTab == 1 ? MyColors.amber : Colors.white)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (route) => false,
                          arguments: 2);
                    },
                    icon: Icon(
                        selectedTab == 2 ? MyIcon.setting_bold : MyIcon.setting,
                        color:
                            selectedTab == 2 ? MyColors.amber : Colors.white)),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SettingItem(
                    title: "خبر روشن شدن خودرو",
                    type: ItemType.Switch,
                    value:
                        context.read<HomeP>().selectedImei!.caron_notif == '1',
                    onTap: (val) {
                      ApiStatus.appNotificationSetting(
                          imei: context.read<HomeP>().selectedImei!.imei!,
                          text: 'c=' + (val ? 'on' : 'off')).then((value){
                        Provider.of<HomeP>(context, listen: false).selectedImei=value;
                      });
                    }),
                SettingItem(
                    title: "خبر قطع شدن باتری",
                    type: ItemType.Switch,
                    value: context.read<HomeP>().selectedImei!.battery_notif ==
                        '1',
                    onTap: (val) {
                      ApiStatus.appNotificationSetting(
                          imei: context.read<HomeP>().selectedImei!.imei!,
                          text: 'b=' + (val ? 'on' : 'off')).then((value){
                        Provider.of<HomeP>(context, listen: false).selectedImei=value;
                      });
                    }),
                SettingItem(
                    title: "خبر تجاوز از سرعت مجاز",
                    type: ItemType.Switch,
                    value: context.read<HomeP>().selectedImei!.maxspeed_notif ==
                        '1',
                    onTap: (val) {
                      ApiStatus.appNotificationSetting(
                          imei: context.read<HomeP>().selectedImei!.imei!,
                          text: 's=' + (val ? 'on' : 'off')).then((value){
                        Provider.of<HomeP>(context, listen: false).selectedImei=value;
                      });
                    }),
                SettingItem(
                    title: "خبر شارژ کمتر از 1000 تومان",
                    type: ItemType.Switch,
                    value:
                        context.read<HomeP>().selectedImei!.sharj_notif == '1',
                    onTap: (val) {
                      ApiStatus.appNotificationSetting(
                          imei: context.read<HomeP>().selectedImei!.imei!,
                          text: 'sh=' + (val ? 'on' : 'off')).then((value){
                        Provider.of<HomeP>(context, listen: false).selectedImei=value;
                      });
                    }),
              ],
            ),
          ),
        ));
  }
}
