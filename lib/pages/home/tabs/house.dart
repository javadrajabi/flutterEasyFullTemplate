import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/models/status/Device.dart';
import 'package:template/models/status/Imei.dart';
import 'package:template/data/webService/requests/status-api.dart';
import '../../../widget/syncfusion_flutter_gauges/gauges.dart';
import 'house/dropdown.dart';
import 'package:provider/provider.dart';
import '../../../provider/homeProvider.dart';
import 'package:url_launcher/url_launcher.dart';

class House extends StatefulWidget {
  @override
  _HouseState createState() => _HouseState();
}

class _HouseState extends State<House> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem<String>(child: const Text('Doge'), value: 'Doge'),
        PopupMenuItem<String>(child: const Text('Lion'), value: 'Lion'),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: DropDownW(
                    onTap:(){
                      Provider.of<HomeP>(context, listen: false).getDevicelist();

                      print('|||||||||||||||""||"|"|"|"');
                      print(context.read<HomeP>().selectedImei!.toJson());
                    },
                    selectedImei: context.watch<HomeP>().selectedImei,
                    options: context.watch<HomeP>().devices!.device_list,
                    onChange: (Device dev) {
                      print('||||||||||||---DEVICE CHANGE---|||""||"|"|"|"');
                      Provider.of<HomeP>(context, listen: false).setDefaultImei(Imei.fromJson(dev.imei!.toJson()));

                      setState(() {
                        print(1);
                      });
                    },
                  )),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: MyColors.indigo,
                          //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'باتری دستگاه',
                            style:
                                TextStyle(fontSize: 12, color: MyColors.gray),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  (
                                  context
                                      .watch<HomeP>()
                                      .lastState?.dbs.toString()??'0' )+'%',
                                  style: TextStyle(fontSize: 12, color:
                                  (context
                                      .watch<HomeP>()
                                      .lastState
                                      ?.dbs?? 0) < 30?Colors.red: (context
                                      .watch<HomeP>()
                                      .lastState
                                      ?.dbs?? 0) <60?Colors.yellow:Colors.green,),
                                ),
                                Icon(
                                  (context
                                      .watch<HomeP>()
                                      .lastState
                                      ?.dbs ??0)< 30?MyIcon.battery_empty: (context
                                      .watch<HomeP>()
                                      .lastState?.dbs ??0 )<60?MyIcon.battery_half:MyIcon.battery_full,



                                  color:context
                                      .watch<HomeP>()
                                      .lastState!
                                      .dbs! < 30?Colors.red: (context
                                      .watch<HomeP>()
                                      .lastState!
                                      .dbs!<60?Colors.yellow:Colors.green),
                                  size: 16,
                                )
                              ],
                            ),
                          )
                        ],
                      )))
            ],
          ),
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                          top: 5, bottom: 5, left: 0, right: 10),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: MyColors.indigo,
                          //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/weather/' +
                                context.watch<HomeP>().weather['weather'][0]
                                ['icon'] +
                                '@2x.png',
                            height: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ((context.watch<HomeP>().weather['main']['humidity'] ??
                                    0)
                                    )
                                    .toString() +

                                      '%',
                                style: TextStyle(
                                    fontSize: 12, color: MyColors.gray),
                              ),
                              Text(
                                  ((context.watch<HomeP>().weather['main']['temp'] ??
                                    0)
                                    .floor() -
                                    273)
                                    .toString() +  '°C',
                                style: TextStyle(
                                    fontSize: 12, color: MyColors.gray),
                              )
                            ],
                          )
                        ],
                      ))),
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: MyColors.indigo,
                          //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          )),
                      child: InkWell(
                        onTap: (){

                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'موقعیت :',
                              style:
                                  TextStyle(fontSize: 12, color: MyColors.gray),
                            ),
                            Center(
                              child: Text(
                                context.watch<HomeP>().address,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ))),
            ],
          ),
        ),
        Flexible(
          flex: 12,
          fit: FlexFit.tight,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1 /*or any integer value above 0 (optional)*/,
                        child: Container(
                            // padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(
                                top: 5, bottom: 5, left: 0, right: 10),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: MyColors.indigo,
                                //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    SfRadialGauge(axes: <RadialAxis>[
                                      // RadialAxis(
                                      //     startAngle: 270,
                                      //     endAngle: 270,
                                      //     minimum: 0,
                                      //     maximum: 80,
                                      //     interval: 10,
                                      //     radiusFactor: 0.4,
                                      //     showAxisLine: false,
                                      //     showLastLabel: false,
                                      //     minorTicksPerInterval: 4,
                                      //     majorTickStyle: MajorTickStyle(
                                      //         length: 8, thickness: 3, color: Colors.white),
                                      //     minorTickStyle: MinorTickStyle(
                                      //         length: 3, thickness: 1.5, color: Colors.grey),
                                      //     axisLabelStyle: GaugeTextStyle(
                                      //         color: Colors.white,
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: 14),
                                      //     onLabelCreated: labelCreated),
                                      RadialAxis(
                                        minimum: (0).floor().floorToDouble(),
                                        maximum: (200).floor().floorToDouble(),
                                        labelOffset: 13,
                                        axisLineStyle: AxisLineStyle(
                                            thicknessUnit: GaugeSizeUnit.factor,
                                            thickness: 0.03),
                                        majorTickStyle: MajorTickStyle(
                                            length: 8,
                                            thickness: 4,
                                            color: Colors.white),
                                        minorTickStyle: MinorTickStyle(
                                            length: 6,
                                            thickness: 3,
                                            color: Colors.white),
                                        axisLabelStyle: GaugeTextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        ranges: <GaugeRange>[
                                          GaugeRange(

                                              // rangeOffset: 0.05,
                                              startValue: (0).toDouble(),
                                              endValue: (200).toDouble(),
                                              sizeUnit: GaugeSizeUnit.factor,
                                              startWidth: 0.10,
                                              endWidth: 0.10,
                                              gradient: SweepGradient(
                                                  colors: const <Color>[
                                                    Colors.blue,
                                                    Colors.lightGreenAccent,
                                                    Colors.yellow,
                                                    Colors.deepOrange,
                                                    Colors.red,
                                                  ],
                                                  stops: const <double>[
                                                    0.0,
                                                    0.40,
                                                    0.50,
                                                    0.75,
                                                    1
                                                  ]))
                                        ],
                                        pointers: <GaugePointer>[
                                          NeedlePointer(
                                              value:

                                              context
                                                      .watch<HomeP>()
                                                      .lastState!
                                                      .spd!
                                                      .toDouble()
                                                  ,
                                              needleLength: 0.80,
                                              enableAnimation: true,
                                              animationType: AnimationType.ease,
                                              needleStartWidth: 1.5,
                                              needleEndWidth: 6,
                                              needleColor: Colors.red,
                                              knobStyle: KnobStyle(
                                                  knobRadius: 0.09,
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor))
                                        ],
                                      )
                                    ]),
                                    Text(
                                       context
                                              .watch<HomeP>()
                                              .lastState!
                                              .spd!
                                              .toString() + ' Km/h',
                                      textDirection: TextDirection.ltr,
                                    )
                                  ],
                                ),

                                // Speedometer(
                                //   backgroundColor: MyColors.indigo,
                                //   kimColor: MyColors.gray,
                                //   meterColor: Colors.green,
                                //   warningColor: Colors.red,
                                //   size: 150,
                                //   minValue: 0,
                                //   maxValue: 250,
                                //   currentValue: speed,
                                //   warningValue: 120,
                                //   displayText: 'km/h',
                                // ),
                                Center(
                                    child: TextButton(
                                        child: Text(
                                          " نمایش نمودار سرعت ".toUpperCase(),
                                          // style: TextStyle(fontSize: 14)
                                        ),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(EdgeInsets.all(5)),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0),
                                                    side: BorderSide(color: Colors.white)))),
                                        onPressed: () {})
                                    // Text('نمایش نمودار سرعت')
                                    )
                              ],
                            ))),
                  ],
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1 /*or any integer value above 0 (optional)*/,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if ((context.read<HomeP>().lastState?.suc??'0') == '1') {
                                  ApiStatus.changeSecurity(imei: context.read<HomeP>().lastState!.imei!, status: '0');
                                } else {
                                  ApiStatus.changeSecurity(imei: context.read<HomeP>().lastState!.imei!, status: '1');
                                }

                              });
                            },
                            child: Container(
                                // padding: EdgeInsets.all(5),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: MyColors.indigo,
                                    //new Color.fromRGBO(255, 0, 0, 0.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      (( context.read<HomeP>().lastState?.suc ?? '0') == '1')
                                          ? MyIcon.shield_done
                                          : MyIcon.shield_fail,
                                      // size: 16,
                                      color: (( context.read<HomeP>().lastState?.suc ?? '0') == '1')
                                          ? Colors.blue
                                          : Colors.red,
                                      size: 30,
                                    ),
                                    Text(
                                      'دزدگیر',
                                      style: TextStyle(
                                          fontSize: 12, color: MyColors.gray),
                                    ),
                                  ],
                                )),
                          )),
                      Expanded(
                          flex: 1 /*or any integer value above 0 (optional)*/,
                          child: InkWell(
                            onTap: (){
                              if(context.read<HomeP>().selectedImei?.In != null){
                                launch("tel://"+context.read<HomeP>().selectedImei!.In!);

                              }
                            },
                            child: Container(
                                // padding: EdgeInsets.all(5),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: MyColors.indigo,
                                    //new Color.fromRGBO(255, 0, 0, 0.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone_in_talk_outlined,
                                      // size: 16,
                                      color: Colors.green, size: 30,
                                    ),
                                    Text(
                                      'شنود',
                                      style: TextStyle(
                                          fontSize: 12, color: MyColors.gray),
                                    ),
                                  ],
                                )),
                          )),
                      Expanded(
                          flex: 1 /*or any integer value above 0 (optional)*/,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if ((context.read<HomeP>().lastState?.cs??'0') == '1') {
                                  ApiStatus.changePower(imei: context.read<HomeP>().lastState!.imei!, status: '0');
                                } else {
                                  ApiStatus.changePower(imei: context.read<HomeP>().lastState!.imei!, status: '1');
                                }

                              });
                            },
                            child: Container(
                                // padding: EdgeInsets.all(5),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: MyColors.indigo,
                                    //new Color.fromRGBO(255, 0, 0, 0.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.power_settings_new,
                                      color:(( context.read<HomeP>().lastState?.cs ?? '0') == '0')
                                          ? Colors.red
                                          : Colors.green,
                                      size: 30,
                                      // size: 22,
                                    ),
                                    Text(
                                      (( context.read<HomeP>().lastState?.cs ?? '0') == '0')
                                          ? 'روشن کردن'
                                          : 'خاموش کردن',
                                      style: TextStyle(
                                          fontSize: 12, color: MyColors.gray),
                                    ),
                                  ],
                                )),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
