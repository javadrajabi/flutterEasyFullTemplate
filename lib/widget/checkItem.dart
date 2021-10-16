import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckItem extends StatefulWidget {
  final bool? status;
  final String? name;
  final String? doAt;
  final String? doneAt;
  final String? comment;
  final String? doMinutes;
  final String? doneMinutes;
  final Function? onChange;

  CheckItem(
      {@required this.status,
      this.doneMinutes,
      this.onChange,
      this.doMinutes,
      this.comment,
      @required this.doAt,
      this.doneAt,
      @required this.name});

  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {
  bool enabled = false;
  int doneMinutes=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enabled = widget.status!;
  }

  Duration _duration = Duration(hours: 0, minutes: 0);
  String sTime = '00:00';
  int hour = 0, minute = 0;

  getTime() async {
    _duration = (await showDurationPicker(
      context: context,
      initialTime: Duration(minutes: 30),
    ))!;
    print(_duration);
    if(_duration!=null){
      setState(() {
        doneMinutes=_duration.inMinutes;
        hour = (_duration.inMinutes / 60).floor();
        minute = (_duration.inMinutes.remainder(60));
        // sTime = (_duration.inMinutes / 60).floor().toString() +
        //     ':' +
        //     (_duration.inMinutes.remainder(60)).toString();
      });

      return (_duration.inMinutes / 60).floor().toString() +
          ':' +
          (_duration.inMinutes.remainder(60)).toString();
    }else{
      setState(() {
        hour = 0;
        minute = 0;
      });
      return  '00:00' ;
    }

  }

  Future<bool?> _showMyDialog() async {
    // bool showError = true;
    return showDialog<bool>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('تغییر وضعیت'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'آیا مطمئن هستید که میخواهید وضعیت وظیفه را تغییر دهید؟'),
                  SizedBox(
                    height: 20,
                  ),
                  !enabled
                      ? Text('زمان صرف شده برای انجام این تسک را وارد کنید')
                      : SizedBox(),
                  !enabled
                      ? ElevatedButton(
                          onPressed: () async{
                            // print(2222);
                            final vv=await getTime();

                            print(vv);
                            setState(() {
                              sTime=vv;
                            });
                            // print(1111111);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              sTime,
                              style: TextStyle(fontSize: 25),
                            ),
                          ))
                      : SizedBox(),
                  ((hour + minute) == 0 && !enabled)
                      ? Text(
                          'زمان را درست وارد کنید',
                          style: TextStyle(color: Colors.red),
                        )
                      : SizedBox()
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('لغو'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                width: 60,
              ),
              !enabled
                  ? TextButton(
                      child: Text('انجام شد'),
                      onPressed: () {
                        if ((hour + minute) != 0) {
                          Navigator.of(context).pop(true);
                        }
                      },
                    )
                  : TextButton(
                      child: Text('انجام نشد'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
            ],
          );
        });
      },
    );
  }
  Future<void> _showInfoDialog(text) async {
    // bool showError = true;
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('جزییات'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('تایید'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(widget.name ?? '')]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'تاریخ انجام : ' + widget.doAt! ?? '',
              style: TextStyle(fontSize: 12),
            ),
            Text('تاریخ پایان : ' + widget.doneAt! ?? '',
                style: TextStyle(fontSize: 12))
          ]),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'زمان پیشبینی شده : ' + widget.doMinutes! ?? '',
            style: TextStyle(fontSize: 10),
          ),
          Text(
            'زمان صرف شده : ' + widget.doneMinutes! ?? '',
            style: TextStyle(fontSize: 10),
          ),
          (widget.comment != '' && widget.comment != null)
              ? InkWell(
                  onTap: () {
                    _showInfoDialog(widget.comment);
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                      )))
              : SizedBox()
        ],
      ),
      leading: InkWell(
        onTap: () async {
          final res = await _showMyDialog();
          setState(() {
            if (res != null) {
              if (res) {
                enabled = true;
                widget.onChange!({"status":true,"doneMinutes":doneMinutes});
              } else {
                enabled = false;
                widget.onChange!({"status":false});
              }
            }
          });
        },
        child: enabled
            ? Container(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.check_box,
                  color: Colors.green,
                ))
            : Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.check_box_outline_blank, color: Colors.red)),
      ),
    );
  }
}
