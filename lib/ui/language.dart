import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:template/config/themes/themesData.dart';
import '../config/languages/data/default_data.dart';
import '../provider/localization.dart';
import '../config/languages/localization/app_localization.dart';

class Language extends StatefulWidget {
  final String? title;
  final void Function(DateTime)? onDateSelected;

  Language({this.title, this.onDateSelected});

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final DefaultData defaultData = DefaultData();

  // late DateTime _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.apps_sharp),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(2),
        ),
        child:
            Consumer<LocalizationData>(builder: (context, currentData, child) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Let\'s speak '),
                    Container(
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
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  AppLocalization.of(context)!.translate('hello-world'),
                  style: TextStyle(color: Colors.indigo, fontSize: 30),
                ),
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(color: Colors.indigo, fontSize: 30),
                ),
                IconButton(
                  onPressed: () {
                    currentData.changeBrightnessToDark();
                  },
                  icon: Icon(
                    context.watch<LocalizationData>().darkMode
                        ? Icons.brightness_5
                        : Icons.brightness_3,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
