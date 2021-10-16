import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/pages/setting/widgets/setting_item.dart';
import 'package:template/data/webService/requests/status-api.dart';
import 'package:template/widget/popUp/showQuestionMessage.dart';
import 'package:provider/provider.dart';
import '../../provider/homeProvider.dart';
class SmsAlertSetting extends StatefulWidget {
  const SmsAlertSetting({Key? key}) : super(key: key);

  @override
  _SmsAlertSettingState createState() => _SmsAlertSettingState();
}

class _SmsAlertSettingState extends State<SmsAlertSetting> {
  bool isSwitched = true;
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
            title: Text('اعلانات پیامکی',style: TextStyle(color: MyColors.gray,fontSize: 18),),
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
                    title: "خبر روشن شدن خودرو " ,
                    type:ItemType.Normal ,
                    onTap: (val) async{
                    final answer= await showQuestionMessage(text: 'تغییر وضعیت خبر روشن شدن خودرو',context: context,yes: 'فعال',no:'غیر فعال');
                    if(answer == true){
                      ApiStatus.smsNotificationSetting(imei: context.read<HomeP>().selectedImei!.imei!, text: 'c=on');
                    }else if(answer == false){
                      ApiStatus.smsNotificationSetting(imei: context.read<HomeP>().selectedImei!.imei!, text: 'c=off');
                    }
                    }),
                SettingItem(
                    title: "خبر قطع شدن باتری " ,
                    type:ItemType.Normal ,
                    onTap: (val)async{
                      final answer= await showQuestionMessage(text: 'تغییر وضعیت خبر قطع شدن باتری',context: context,yes: 'فعال',no:'غیر فعال');
                      if(answer == true){
                        ApiStatus.smsNotificationSetting(imei: context.read<HomeP>().selectedImei!.imei!, text: 'b=on');
                      }else if(answer == false){
                        ApiStatus.smsNotificationSetting(imei: context.read<HomeP>().selectedImei!.imei!, text: 'b=off');
                      }
                    }),
                SettingItem(
                    title: "خبر تجاوز از سرعت مجاز " ,
                    type:ItemType.Normal ,
                    onTap: (val)async{
                      final answer= await showQuestionMessage(text: 'تغییر وضعیت خبر تجاوز از سرعت مجاز "',context: context,yes: 'فعال',no:'غیر فعال');
                      if(answer == true){
                        ApiStatus.smsNotificationSetting(imei: context.read<HomeP>().selectedImei!.imei!, text: 's=on');
                      }else if(answer == false){
                        ApiStatus.smsNotificationSetting(imei: context.read<HomeP>().selectedImei!.imei!, text: 's=off');
                      }
                    }),

              ],
            ),
          ),
        ));
  }
}
