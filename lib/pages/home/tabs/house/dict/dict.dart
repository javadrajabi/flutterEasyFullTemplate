import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/pages/home/tabs/house/dict/widget/fastDictCard.dart';
import 'package:template/data/webService/requests/dict.dart';
import 'package:template/widget/full_screen_image/full_screen_image.dart';
import 'package:template/widget/syncfusion_flutter_gauges/gauges.dart';

class Dict extends StatefulWidget {
  const Dict({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<Dict> with TickerProviderStateMixin {
  TextEditingController controller = new TextEditingController();
  List words = [];
  bool showResult = false, clicked = false;
  Map fastDicData = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [MyColors.cyanLite, MyColors.indigo],
          )),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: MyColors.indigo,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {
                    // controller.clear();
                    // onSearchTextChanged('');
                  },
                ),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  onChanged: (s) {
                    if (!clicked) {
                      _onSearchChanged(s);
                    } else {
                      clicked = false;
                    }
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      showResult = false;
                    });
                    // controller.clear();
                    // onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // 'type': type,
                    // 'means': means,
                    // 'phonotic': phonoticText,
                    // 'fromTo': fromTo
                    if (fastDicData['fromTo'] != null)
                      FastDictCard(
                        fromTo: fastDicData['fromTo'] == 'entofa'
                            ? FastDictFromTo.ENtoFA
                            : FastDictFromTo.FAtoEN,
                        means: fastDicData['means'] ?? [],
                        phonotic: fastDicData['phonotic'] ?? '',
                        sounds: fastDicData['sounds'],
                        word: fastDicData['word'] ?? '',
                        wordType: fastDicData['wordType'],
                        onSelect: () {},
                      ),

                    Card(
                      color: MyColors.indigo,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Directionality(
                            // use this
                            textDirection: TextDirection.ltr, // set it to rtl
                            child: ListTile(
                              leading: Icon(Icons.language),
                              title: Text(
                                'World',
                                style: TextStyle(color: MyColors.amber),
                              ),
                              subtitle: Text(
                                'US: /ˈwɜːrd/ - UK: /ˈwɜːd/',
                                style: TextStyle(
                                    color: MyColors.gray, fontFamily: 'Roboto'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.volume_up_sharp),
                              Icon(Icons.volume_up_sharp),
                              Icon(Icons.volume_up_sharp)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Wrap(
                              children: [
                                FilterChip(
                                  label: Text('لغت'),
                                  selected: true,
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('کلمه'),
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('جمله'),
                                  selected: true,
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('معنی'),
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('لغت'),
                                  selected: true,
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('کلمه'),
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('جمله'),
                                  selected: true,
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('کلمه'),
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('جمله'),
                                  selected: true,
                                  onSelected: (bool value) {},
                                ),
                                FilterChip(
                                  label: Text('معنی'),
                                  onSelected: (bool value) {},
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SelectableText(
                              'معانی دیگر: کلام، آگهداد، پیام، اطلاع، شایعه، زبانزد، حکم، دستور، پیمان، (w بزرگ - با the) کلام الله، کتاب مقدس، انجیل (the word of god هم می گویند)، (جمع) متن (در برابر مثلا موسیقی)، مطلب، (جمع) مشاجره، محاجه، دعوای لفظی، بگومگو، حرف ناخوشایند، (کامپیوتر) واژ، (با واژه) بیان کردن، در قالب لغت ریختن، به لفظ درآوردن، رجوع شود به: password، (قدیمی) ضرب المثل، گفته، (قدیمی) حرف زدن، سخن گفتن، عبارت',
                              style: TextStyle(color: MyColors.gray),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                textColor: MyColors.orange,
                                onPressed: () {
                                  // Perform some action
                                },
                                child: Text('معانی بیشتر'),
                              ),
                              FlatButton(
                                textColor: MyColors.orange,
                                onPressed: () {
                                  // Perform some action
                                },
                                child: Text('جملات مرتبط'),
                              ),
                              FlatButton(
                                textColor: MyColors.orange,
                                onPressed: () {
                                  // Perform some action
                                },
                                child: Text('مترادف'),
                              ),
                              FlatButton(
                                textColor: MyColors.orange,
                                onPressed: () {
                                  // Perform some action
                                },
                                child: Text('به انگلیسی'),
                              ),
                            ],
                          ),
                          // Image.asset('assets/card-sample-image.jpg'),
                          // Image.asset('assets/card-sample-image-2.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      color: MyColors.indigo,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.language),
                            title: Text(
                              'تصاویر مرتبط',
                              style: TextStyle(color: MyColors.amber),
                            ),
                          ),
                          Wrap(
                            children: [
                              Hero(
                                tag: '1',
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black12.withOpacity(0.6),
                                        barrierDismissible: true,
                                        barrierLabel: "Dialog",
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (_, __, ___) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Hero(
                                              tag: '1',
                                              child: InteractiveViewer(
                                                child: Image.asset(
                                                  "assets/appIcon.png",
                                                  fit: BoxFit.contain,
                                                ),
                                                maxScale: 5.0,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/appIcon.png",
                                          fit: BoxFit.cover,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) -
                                              5,
                                        ),
                                        // SvgPicture.asset(
                                        //   MIcons.picture,
                                        //   width: GetSize.wt(context, 8),
                                        // ),
                                        // Intermediate(context, 0.5),
                                        Text(
                                          'view',
                                          style: TextStyle(
                                            color: MyColors.indigo
                                                .withOpacity(0.65),
                                            // fontSize: GetSize.wt(context, 3),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '1',
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black12.withOpacity(0.6),
                                        barrierDismissible: true,
                                        barrierLabel: "Dialog",
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (_, __, ___) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Hero(
                                              tag: '1',
                                              child: InteractiveViewer(
                                                child: Image.asset(
                                                  "assets/appIcon.png",
                                                  fit: BoxFit.contain,
                                                ),
                                                maxScale: 5.0,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/appIcon.png",
                                          fit: BoxFit.cover,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) -
                                              5,
                                        ),
                                        // SvgPicture.asset(
                                        //   MIcons.picture,
                                        //   width: GetSize.wt(context, 8),
                                        // ),
                                        // Intermediate(context, 0.5),
                                        Text(
                                          'view',
                                          style: TextStyle(
                                            color: MyColors.indigo
                                                .withOpacity(0.65),
                                            // fontSize: GetSize.wt(context, 3),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '1',
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black12.withOpacity(0.6),
                                        barrierDismissible: true,
                                        barrierLabel: "Dialog",
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (_, __, ___) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Hero(
                                              tag: '1',
                                              child: InteractiveViewer(
                                                child: Image.asset(
                                                  "assets/appIcon.png",
                                                  fit: BoxFit.contain,
                                                ),
                                                maxScale: 5.0,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/appIcon.png",
                                          fit: BoxFit.cover,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) -
                                              5,
                                        ),
                                        // SvgPicture.asset(
                                        //   MIcons.picture,
                                        //   width: GetSize.wt(context, 8),
                                        // ),
                                        // Intermediate(context, 0.5),
                                        Text(
                                          'view',
                                          style: TextStyle(
                                            color: MyColors.indigo
                                                .withOpacity(0.65),
                                            // fontSize: GetSize.wt(context, 3),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '1',
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black12.withOpacity(0.6),
                                        barrierDismissible: true,
                                        barrierLabel: "Dialog",
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (_, __, ___) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Hero(
                                              tag: '1',
                                              child: InteractiveViewer(
                                                child: Image.asset(
                                                  "assets/appIcon.png",
                                                  fit: BoxFit.contain,
                                                ),
                                                maxScale: 5.0,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/appIcon.png",
                                          fit: BoxFit.cover,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) -
                                              5,
                                        ),
                                        // SvgPicture.asset(
                                        //   MIcons.picture,
                                        //   width: GetSize.wt(context, 8),
                                        // ),
                                        // Intermediate(context, 0.5),
                                        Text(
                                          'view',
                                          style: TextStyle(
                                            color: MyColors.indigo
                                                .withOpacity(0.65),
                                            // fontSize: GetSize.wt(context, 3),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '1',
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black12.withOpacity(0.6),
                                        barrierDismissible: true,
                                        barrierLabel: "Dialog",
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (_, __, ___) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Hero(
                                              tag: '1',
                                              child: InteractiveViewer(
                                                child: Image.asset(
                                                  "assets/appIcon.png",
                                                  fit: BoxFit.contain,
                                                ),
                                                maxScale: 5.0,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/appIcon.png",
                                          fit: BoxFit.cover,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) -
                                              5,
                                        ),
                                        // SvgPicture.asset(
                                        //   MIcons.picture,
                                        //   width: GetSize.wt(context, 8),
                                        // ),
                                        // Intermediate(context, 0.5),
                                        Text(
                                          'view',
                                          style: TextStyle(
                                            color: MyColors.indigo
                                                .withOpacity(0.65),
                                            // fontSize: GetSize.wt(context, 3),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (showResult)
                ListView.builder(
                  itemCount: words.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          setState(() {
                            showResult = false;
                            clicked = true;
                            controller.text = words[i]['word'];

                          });
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            // elevation: 10.0,
                            color: MyColors.grey_90.withOpacity(0.7),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    words[i]['word'],
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    words[i]['meaning'].length > 35
                                        ? words[i]['meaning'].substring(0, 35) +
                                            '...'
                                        : words[i]['meaning'],
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ))

                        // Column(
                        //   children: [
                        //     Divider(
                        //       height: 2,
                        //     ),
                        //     Container(
                        //       padding: EdgeInsets.only(
                        //           top: 5, bottom: 5, left: 10, right: 10),
                        //       // elevation: 10.0,
                        //       color: MyColors.grey_90.withOpacity(0.7),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.end,
                        //         children: [
                        //           Text(
                        //             words[i],
                        //             style: TextStyle(fontSize: 18),
                        //           )
                        //         ],
                        //       ),
                        //
                        //       margin: EdgeInsets.all(0.0),
                        //     ),
                        //   ],
                        // ),
                        );
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }



  Timer? _debounce;

  _onSearchChanged(String? searchText) async {
    print("onchange 123 ---");
//    setState(() {
//      runs=true;
//    });
    if (searchText != null || searchText != "") {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 1000), () {
//      runs=true;
        setState(() {
          onSearchTextChanged(searchText ?? '');
        });

        print("Query 123 ---");

        // do something with _searchQuery.text
      });
    }
  }

  onSearchTextChanged(String text) async {
    if (text.trim() != '') {
      ApiDict.GuessTheWordFastDict(text).then((value) {
        print('GGGGGGGGGGGGGGGGGGGGGGGHHHHHHHHHHHHHHHHHHHHHHH');
        log(value[0]['meaning'].toString());
        setState(() {
          words = value;
          showResult = true;
        });
      });
      // ApiDict.GuessTheWordAbadis(text).then((value) {
      //   setState(() {
      //     words = value;
      //     showResult = true;
      //   });
      // });
    }
  }
}
