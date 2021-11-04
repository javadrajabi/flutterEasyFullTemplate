import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/provider/notifProvider.dart';
import 'package:template/ui/home/component/workOut.dart';
import 'package:provider/provider.dart';
import 'package:template/ui/home/tab/widgets/notifCard.dart';
import '../../app_theme.dart';
import 'dateTab/component/turn.dart';

class HomeTab extends StatefulWidget {
  final Function(int)? changeTabIndex;

  const HomeTab({Key? key, this.changeTabIndex}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeP>().getProfile();
// print({"mindate":Jalali.now().formatCompactDate(),"limit":1});
    context.read<HomeP>().getAppointments({"limit": "1"});
    context.read<NotifP>().getNotifList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 9),
        child: Column(children: [
          if (context.watch<HomeP>().profile != null &&
              (context.watch<HomeP>().profile?.lname == null ||
                  context.watch<HomeP>().profile?.lname == ''))
            WorkoutView(
                colors: [FitnessAppTheme.orange, FitnessAppTheme.nearlyOrange],
                child: Text(
                  'لطفا برای استفاده بهتر از خدمات اپلیکیشن پروفایل خود را تکمیل کنید.',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    letterSpacing: 0.0,
                    color: FitnessAppTheme.white,
                  ),
                ),
                buttonText: 'تکمیل پروفایل',
                textColor: FitnessAppTheme.white,
                buttonColor: FitnessAppTheme.white,
                onPress: () {
                  print('111111111111111111111111');
                }),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: ClipRRect(
                child: Image.asset(
                  'assets/logo1.png',
                  width: 40,
                ),
              ),
              title: Text((context.watch<HomeP>().profile?.fname ?? 'نام ثبت') +
                  ' ' +
                  (context.watch<HomeP>().profile?.lname ?? "نیست.")),
              subtitle: Text(context.watch<HomeP>().profile?.mobile ?? ''),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Card(margin: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 9),
          //   child: Row(
          //     children: [
          //       ClipRRect(
          //         child: Image.asset(
          //           'assets/logo1.png',
          //           width: 40,
          //         ),
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       Text('09357586173')
          //     ],
          //   ),
          // ),
          if ((context.watch<HomeP>().appointments?.length ?? 0) <
              1)
            WorkoutView(
              textAlign: TextAlign.center,
              colors: [
                FitnessAppTheme.nearlyBlue,
                FitnessAppTheme.nearlyDarkBlue
              ],
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'اطلاعاتی وجود ندارد.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      letterSpacing: 0.0,
                      color: FitnessAppTheme.white,
                    ),
                  ),
                ),
              ),
              textColor: FitnessAppTheme.white,
            ),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "نوبت بعدی",
                  style: TextStyle(color: FitnessAppTheme.darkPurple),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (widget.changeTabIndex != null) {
                    widget.changeTabIndex!(1);
                  }
                },
                child: Text("نمایش همه", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),

          if ((context.watch<HomeP>().appointments?.length ?? 0) >
              0)
            HomeTurnView(
              subTitle: context
                      .watch<HomeP>()
                      .appointments![0]
                      .description ??
                  '',
              name: context
                      .watch<HomeP>()
                      .appointments![0]
                      .spName ??
                  '',
              address: context
                      .watch<HomeP>()
                      .appointments![0]
                      .address ??
                  '',
              reqDate: context
                      .watch<HomeP>()
                      .appointments![0]
                      .reqDate ??
                  '',
              reserveDate: context
                      .watch<HomeP>()
                      .appointments![0]
                      .reserveDate ??
                  '',
              phone: context
                      .watch<HomeP>()
                      .appointments![0]
                      .mobile ??
                  '',
              time:
                  context.watch<HomeP>().appointments![0].time ??
                      '',
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اعلامیه های اخیر",
                style: TextStyle(color: FitnessAppTheme.darkPurple),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/notifList');
                },
                child: Text("نمایش همه", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          for (int i = 0;
              i < (context.watch<NotifP>().notifList?.length ?? 0);
              i++)
            NofifCard(
              text: context.watch<NotifP>().notifList![i].details ?? '',
              date: context.watch<NotifP>().notifList![i].createdAt ?? '',
            ),

          if (context.watch<NotifP>().notifList == null &&
              (context.watch<NotifP>().notifList?.length ?? 1) < 1)
            Center(
              child: Text(
                "اعلامیه ای وجود ندارد",
                style: TextStyle(fontSize: 14, color: FitnessAppTheme.grey),
              ),
            ),
          SizedBox(
            height: 80,
          )
        ]),
      ),
    );
  }
}
