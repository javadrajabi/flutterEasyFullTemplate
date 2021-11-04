import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:template/config/languages/data/default_data.dart';
import 'package:template/provider/localization.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool noti = true, dark = false, remind = false;


  final DefaultData defaultData = DefaultData();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // IconButton(onPressed: () {
          //
          // }, icon: Icon(Icons.filter)),
          SizedBox(height: 20,),
          Consumer<LocalizationData>(
            builder: (context, currentData, child) {
              return Container(
                width: 100,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: DropdownButton<String>(
                  value: currentData.defineCurrentLanguage(context),
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  elevation: 0,
                  style: TextStyle(color: Colors.white),
                  underline: Container(
                    height: 1,
                  ),
                  dropdownColor: Colors.indigo,
                  onChanged: (String? newValue) {
                    currentData.changeLocale(newValue!);
                    context.read<LocalizationData>().changeLocale(newValue);
                  },
                  items: defaultData.languagesListDefault
                      .map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              );
            },
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                Text(
                  ' تنظیمات ',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            // color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                    Text(' دریافت اعلان ها ',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ],
                ),
                Switch(
                    value: noti,
                    onChanged: (v) {
                      setState(() {
                        noti = !noti;
                      });
                    })
              ],
            ),
          ),
          Container(
              height: 50,
              padding: EdgeInsets.only(left: 30, right: 30),
              // color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        color: Colors.grey,
                      ),
                      Text(' دریافت یادآور ',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                    ],
                  ),
                  Switch(
                      value: remind,
                      onChanged: (v) {
                        setState(() {
                          remind = !remind;
                        });
                      })
                ],
              )),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                Text(
                  ' عمومی ',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            // color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      context.watch<LocalizationData>().darkMode ? Icons.brightness_5 : Icons.brightness_3,
                      color: Colors.grey,
                    ),
                    Text(
                      ' حالت تاریک ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Switch(
                    value: context.watch<LocalizationData>().darkMode,
                    onChanged: (v) {
                      context.read<LocalizationData>().changeBrightnessToDark();
                      // setState(() {
                      //   dark = !dark;
                      // });
                    })
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            // color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                Text(' درباره ی ما ',
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            // color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(
                  Icons.share,
                  color: Colors.grey,
                ),
                Text(
                  ' معرفی به دوستان ',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                Text(
                  ' حساب ها ',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            // color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: Colors.grey,
                ),
                Text(' خروج ',
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
