import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:provider/provider.dart';
import 'package:template/models/status/DeviceList.dart';
import 'package:template/pages/setting/widgets/device_record.dart';
import 'package:template/pages/setting/widgets/setting_item.dart';
import 'package:template/data/webService/requests/status-api.dart';
import 'package:template/widget/custom_switch.dart';
import 'package:template/widget/overlayContainer/overlay_container.dart';
import 'package:template/widget/popUp/showQuestionMessage.dart';
import 'package:template/widget/popUp/showRenameQuestion.dart';
import 'package:template/widget/popUp/showResetQuestion.dart';
import 'package:template/widget/switch/custom_switch.dart';
import '../../../provider/homeProvider.dart';

// import '../../../widget/speedMeter/flutter_speedometer.dart';
import '../../../widget/syncfusion_flutter_gauges/gauges.dart';

class Devices extends StatefulWidget {
  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
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
          body:ListView.builder
            (
              itemCount: context.read<HomeP>().devices?.device_list?.length??0,
              itemBuilder: (BuildContext ctxt, int index) {
                return DeviceRecord(
                  title: context.watch<HomeP>().devices!.device_list![index].imei?.name ?? 'بی نام',
                  onReset: () async{
                   final res= showResetQuestion(text: "آیا مطمئن هستید که میخواهید دستگاه را به تنظیمات کارخانه برگردانید؟",context:context );
                   if(res == true){
                    await ApiStatus.resetDevice(imei: context.watch<HomeP>().devices!.device_list![index].imei!.imei!);
                     context.watch<HomeP>().getDevicelist();

                   }
                  },
                  onRename: () async{
                    final res=await showRenameQuestion(keyboardType:TextInputType.name,name: context.read<HomeP>().devices!.device_list![index].imei?.name ?? 'بی نام',text: 'نام مورد نظر برای این دستگاه را وارد کنید',context: context);
                    print('GGGGGGGGGGGGGGGGGGGGGGGGGGGGGG');
                    print(res);
                    if(res != null && res!=''){

                      ApiStatus.renameDevice(imei: context.read<HomeP>().devices!.device_list![index].imei!.imei!,name: res).then((value) {
                        Provider.of<HomeP>(context, listen: false).deviceRename(index, res);

                      });

                      // context.read<HomeP>().getDevicelist();

                    }
                  },
                );
              }
          )

        ));
  }
}
