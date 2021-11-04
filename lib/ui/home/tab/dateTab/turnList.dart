import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/ui/home/tab/dateTab/component/turn.dart';
import 'package:url_launcher/url_launcher.dart';

class TurnList extends StatefulWidget {
  const TurnList({Key? key}) : super(key: key);

  @override
  _TurnListState createState() => _TurnListState();
}

class _TurnListState extends State<TurnList> {
  getDayString(String date) {
    if (date != '') {
      List spl=date.split(' ')[0].split('/');
      JalaliFormatter f =
          Jalali(int.parse(spl[0]), int.parse(spl[1]), int.parse(spl[2]))
              .formatter;
      return '${f.wN}';
    } else {
      return '';
    }
  }

  String jdateToString(String date, String time) {
    if (date != '') {
      List spl=date.split(' ')[0].split('/');
      JalaliFormatter f =
          Jalali(int.parse(spl[0]), int.parse(spl[1]), int.parse(spl[2]))
              .formatter;
      return ' ${f.d} ${f.mN} ${f.yyyy}' + ' ساعت ' + " $time ";
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('--------------------------------------trgr ');
    log(context.watch<HomeP>().appointments?[0].mobile??'');

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView.separated(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: (context.watch<HomeP>().appointments?.length ?? 0),
            itemBuilder: (context, i) {
              return TurnView(
                  colors: [
                    Colors.lightBlueAccent.shade100,
                    Colors.blueAccent.shade100
                  ],
                  textColor: Colors.red,
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context
                                              .watch<HomeP>()
                                              .appointments?[i]
                                              .reserveDate !=
                                          null
                                      ? getDayString(context
                                          .watch<HomeP>()
                                          .appointments![i]
                                          .reserveDate!)
                                      : '',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                 ' '+   (context
                                                .watch<HomeP>()
                                                .appointments?[i]
                                                .reserveDate !=
                                            null
                                        ? jdateToString(
                                            context
                                                .watch<HomeP>()
                                                .appointments![i]
                                                .reserveDate!,
                                            context
                                                    .watch<HomeP>()
                                                    .appointments![i]
                                                    .time ??
                                                '')
                                        : ''),
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  '  تاریخ ثبت : ' + jdateToString(
                                        context
                                                .watch<HomeP>()
                                                .appointments![i]
                                                .reqDate ??
                                            '',
                                        context
                                                .watch<HomeP>()
                                                .appointments![i]
                                                .reqDate?.split(' ')[1] ??
                                            ''),
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                    context
                                        .watch<HomeP>()
                                        .appointments?[i]
                                        .description??'',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/turnDetails');
                                  },
                                  icon: Icon(
                                    Icons.info_outline,
                                    color: Colors.blue,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/logo1.png',
                                width: 40,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                ),
                                Text(context
                                    .watch<HomeP>()
                                    .appointments?[i]
                                        .spName??'',
                                    style: TextStyle(fontSize: 12)),
                                Text(context
                                    .watch<HomeP>()
                                    .appointments?[i]
                                    .mobile??'',
                                    style: TextStyle(fontSize: 12)),
                                Text(context
                                    .watch<HomeP>()
                                    .appointments?[i]
                                    .address??'',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                print(context
                                    .read<HomeP>()
                                    .appointments?[i]
                                    .mobile);


                                launch("tel://"+(context
                                    .read<HomeP>()
                                    .appointments?[i]
                                    .mobile ??''));
                              },
                              icon: Icon(
                                Icons.call_rounded,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 2,
              );
            },
            padding: EdgeInsets.only(top: 20),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
