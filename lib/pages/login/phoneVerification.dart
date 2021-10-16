import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/data/sharedpref/shared_preference_helper.dart';
import 'package:template/data/local/datasources/LocalDB.dart';
import 'package:template/provider/baseVar.dart';
import '../../../config/themes/textFieldDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/themes/colors.dart';
import '../../data/webService/httpRequest.dart';
import '../../data/webService/requests/login.dart';

class VerificationPhone extends StatefulWidget {
  VerificationPhone();

  @override
  VerificationPhoneState createState() => new VerificationPhoneState();
}

class VerificationPhoneState extends State<VerificationPhone> {
  TextEditingController ctrl = TextEditingController();
  TextEditingController ctr2 = TextEditingController();
  String errorMessage = '',hash='';

  bool sendCode=false,haveError=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl.text = "";
    ctr2.text = "";
    _timer=Timer(Duration(seconds: 1),(){

    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return
      //"${twoDigits(duration.inHours)}:"
        "$twoDigitMinutes:$twoDigitSeconds";
  }

  late Timer _timer;
  int _start = 119;
  // DateTime timeText=DateTime(12221212);
  Duration timeText = Duration(hours: 0, minutes: 3, seconds: 2);
  void startTimer() {
    if (_timer.isActive) {
      _timer.cancel();

    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
            (Timer timer) => setState(
              () {


            if (_start < 1) {
              sendCode=false;
              timer.cancel();
            } else {

              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.cyan,
      // appBar: PreferredSize(
      //     child: Container(),
      //     preferredSize: Size.fromHeight(0)
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(MyIcon.gps_icon3,size: 100,),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(sendCode?'کد تایید 4 رقمی به شماره شما ارسال شد.':
                  'کاربر گرامی خوش آمدید. \n برای ورود به برنامه شماره موبایل خود را وارد کنید.',
                  textAlign: TextAlign.center,
                ),
              ),
              if(sendCode)
                Text(
          _printDuration(Duration(seconds: _start)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColors.amber,fontSize: 22),
                ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(top: 30,bottom: MediaQuery.of(context).size.height/6 ),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration:  BoxDecoration(
                    color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius:  BorderRadius.only(
                        topLeft:  Radius.circular(40.0),
                        topRight:  Radius.circular(40.0))),
                child: Column(children: [
                  Container(
                    padding:  EdgeInsets.only(right: 40,bottom: 15),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(sendCode?
                    'کد تایید را وارد کنید :': 'شماره تماس :',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      autofocus: false,
                      maxLength: sendCode? 4:11,
                      controller: sendCode?ctrl:ctr2,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 22.0, color: MyColors.gray),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.cyan,
                        hintText: sendCode?'xxxx':'09112223344',
                        counter: Offstage(),
                        contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0,right: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.cyan),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.cyan),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                if(haveError)
                  Container(
                    padding:  EdgeInsets.only(right: 40),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      sendCode?'* کد وارد شده صحیح نمی باشد!':'* شماره وارد شده نامعتبر و یا ثبت نشده است!',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: MyColors.orange,fontSize: 13),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                            if(sendCode){


                              // setState(() {
                              //   sendCode=false;
                              // });

                              ApiLogin.verifyCode(mobile:ctr2.text,hash:hash,code:ctrl.text).then((value){
                                SharedPreferenceHelper.setUserData(value);
                                HttpRequest.token = value!.access_token!;
                                BaseVar.userData = value;
                                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

                                }).onError((error, stackTrace) {
                                  print(error);
                                setState(() {
                                  haveError=true;
                                });
                              });


                            }else{

                              _start=120;
                              ApiLogin.phoneVerification(mobile:ctr2.text).then((value){
                                print(value);
                                startTimer();
                                hash=value!.hash!;
                                setState(() {
                                  haveError=false;
                                  sendCode=true;
                                });
                              }).onError((error, stackTrace){
                                print(error);
                                setState(() {
                                  haveError=true;
                                });
                              });
                              
                              
                            }

                      },
                      child: Text(sendCode?'ورود به برنامه':'دریافت کد تایید',style: TextStyle(color:MyColors.cyan ),),
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.amber, // This is what you need!
                      ),
                    ),
                  )
                ],),
              ),

            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }
}
