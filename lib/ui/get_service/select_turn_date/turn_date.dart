import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:shamsi_date/extensions.dart';
import 'package:template/data/models/member/services_provider.dart';
import 'package:template/data/models/member/zarfiyat_list.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/ui/get_service/select_turn_date/widget/date_picker_content.dart';
import 'package:template/ui/get_service/select_turn_date/widget/select_day.dart';
import 'package:template/ui/get_service/services.dart';
import 'package:template/ui/get_service/widget/service_record.dart';
import 'package:template/ui/widgets/buttons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class SelectTurnDate extends StatefulWidget {
  final arg;

  const SelectTurnDate({Key? key, required this.arg}) : super(key: key);

  @override
  _SelectTurnDateState createState() => _SelectTurnDateState();
}

class _SelectTurnDateState extends State<SelectTurnDate> {
  final double runSpacing = 5;
  final double spacing = 3;
  final int listSize = 8;
  final columns = 4;
  bool loading =true;
  late Jalali selectedDate;
  List<Jalali> selectalbeDates = [];
  int? selectedtimeId;

  Jalali stringToJalali(String s) {
    return Jalali.now();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = Jalali.now();

    getZarfiyatDate(date: selectedDate);
    getRezerveselectDate();
  }

  getZarfiyatDate({required Jalali date}) {
    loading=true;
    Provider.of<HomeP>(context, listen: false).getZarfiyatList(
        serviceIds: widget.arg["selected-service"],
        spId: widget.arg["services-providers"].id.toString(),
        // date: date.formatCompactDate()
        date: '1400/01/01'
        // selectedDate.formatCompactDate()
        );
    setState(() {
      loading=false;
      print('#@#@#@#@#');
    });
  }

  getRezerveselectDate() {
    Provider.of<HomeP>(context, listen: false).getReserveList(
        serviceIds: widget.arg["selected-service"],
        spId: widget.arg["services-providers"].id.toString(),
        date: selectedDate.formatCompactDate());
  }

  getselectableDay(List<Zarfiyat> zarfiyatList) {
    zarfiyatList.forEach((element) {
      List dd = element.date!.split('/');
      selectalbeDates.add(Jalali(
          int.parse(dd[0]), int.parse(dd[1]), int.parse(dd[2]), 0, 0, 0));
    });
  }

  bool canSelect(status) {
    if (status == 5 || status == 4 || status == 3 || status == 0) {
      // $availability = 1;
      return true;
    } else if (status == 2) {
      return false;
      // $availability = 2;
    } else if (status == 1 || status == 6) {
      return false;
      // $availability = 3;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print('selectalbeDates????????????????????');
    print(selectalbeDates);
    getselectableDay(context.watch<HomeP>().zarfiyatList ?? []);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "تاریخ نوبت",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      body:loading?Center(child: SizedBox(height: 50,width:50 ,child: CircularProgressIndicator())): SingleChildScrollView(
        child: Column(
          children: [
            ServiceRecord(
              onTop: () {
                Navigator.of(context).pushNamed('/servantDetails',
                    arguments: widget.arg["services-providers"]);
              },
              title: widget.arg["services-providers"].name ?? '',
              text: widget.arg["services-providers"].description ?? '',
            ),
            SelectDay(
              date: Jalali.now(),
              onTop: (date) {
                setState(() {
                  selectedDate = date;
                  selectedtimeId = null;
                });

                if (selectalbeDates.contains(date)) getRezerveselectDate();
              },
            ),
            SizedBox(height: 20,),
            selectalbeDates.length<1?Center(
              child: Text('خدمت دهنده هیچ تاریخی را برای رزرو مشخص نکرده است.'),
            ):
            RadiusButton(
              onTop: () async {
/////////////////////////Example 1////////////////////////////
                Jalali? picked = await showPersianDatePicker(
                  // initialDatePickerMode: PDatePickerMode.,
                  // initialEntryMode: DatePickerEntryMode.input,
                  selectableDayPredicate: (jd) {
                    List selectableDay = selectalbeDates;
                    return selectableDay.contains(jd);
                  },

                  context: context,
                  initialDate: selectalbeDates[0],
                  firstDate: Jalali(1400, 1),
                  lastDate: Jalali(1404, 1),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                    selectedtimeId = null;
                  });
                  getRezerveselectDate();
                }
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return DatePickerContent();
                //     });
                print('11111111111111');
              },
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'انتخاب تاریخ دیگر',
                  style: TextStyle(color: Colors.blue),
                ),
              )),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                ((selectedDate == Jalali.now())
                        ? 'امروز'
                        : selectedDate.formatter.wN) +
                    ' ' +
                    selectedDate.formatter.dd +
                    ' ' +
                    selectedDate.formatter.mN,
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            Divider(),


            selectalbeDates.contains(selectedDate)
                ? Wrap(
                    runSpacing: runSpacing,
                    spacing: spacing,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                        context.watch<HomeP>().reserveList?.length ?? 0,
                        (index) {
                      return RadiusButton(
                        selected:
                            (context.watch<HomeP>().reserveList![index].id ==
                                selectedtimeId),
                        selectAble: canSelect(
                            context.watch<HomeP>().reserveList![index].status),
                        onTop: () {
                          setState(() {
                            selectedtimeId =
                                context.read<HomeP>().reserveList![index].id;
                          });
                          print(selectedtimeId);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              context.watch<HomeP>().reserveList![index].time ??
                                  ''),
                        ),
                      );
                    }),
                  )
                : Center(
                    child: Text('زمانی برای رزرو وجود ندارد.'),
                  ),
            SizedBox(
              height: 40,
            ),
            if (selectedtimeId != null)
              RadiusButton(
                width: 100,
                buttonColors: [Colors.blue, Colors.cyanAccent],
                onTop: () async {
                  print((context.read<HomeP>().profile?.fname ?? 'null') +
                      ' ' +
                      (context.read<HomeP>().profile?.lname ?? 'null'));

                  if ((context.read<HomeP>().profile?.fname != null &&
                          context.read<HomeP>().profile?.fname != '') &&
                      (context.read<HomeP>().profile?.lname != null &&
                          context.read<HomeP>().profile?.lname != '')) {
                    final wantoget = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                                // width: 260.0,
                                // height: 230.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: const Color(0xFFFFFF),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                ),
                                child: Text(
                                    'آیا مطمئن هستید که میخواید نوبت را ثبت کنید؟')),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text('تایید')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('لغو'))
                            ],
                          );
                        });

                    if (wantoget == true) {
                      final rr = await context.read<HomeP>().addAppointment(
                          reserve_id: selectedtimeId!,
                          selected_service_id: widget.arg["selected-service"]);

                      print({
                        "reserve_id": selectedtimeId!,
                        "selected_service_id": widget.arg["selected-service"]
                      });
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                  // width: 260.0,
                                  // height: 230.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xFFFFFF),
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(50.0)),
                                  ),
                                  child: Text(rr)),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('تایید'))
                              ],
                            );
                          });
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/home', (route) => false);
                    }
                  } else {
                    final res = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                                // width: 260.0,
                                // height: 230.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: const Color(0xFFFFFF),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                ),
                                child: DatePickerContent()),
                          );
                        });
                    if (res != null) {
                      // {"fname":famili ,"lname":name}
                      context.read<HomeP>().updateProfile(
                          fname: res["fname"], lname: res["lname"]);
                      print(res);
                    }
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(' رزرو  '),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
