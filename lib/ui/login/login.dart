import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/Utils/device/device_utils.dart';
import 'package:template/data/webService/requests/login.dart';
import 'package:template/ui/home/home.dart';
import 'package:template/widget/widgets/expandable-bottom-bar/src/controller.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool moaref = false, sendCode = false;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController moarefId = TextEditingController();
  TextEditingController code = TextEditingController();
  String hash = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/logo1.png',
              width: 60,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'دکتر اپ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ورود',
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (!sendCode)
                        TextField(
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          controller: phoneNumber,
                          style: TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'شماره همراه خود را وارد کنید',
                            labelText: 'شماره همراه:',
                            hintStyle: TextStyle(fontSize: 12),
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      if (!moaref && !sendCode)
                        TextButton(
                            onPressed: () {
                              setState(() {
                                moaref = true;
                              });
                            },
                            child: Text('کد معرف')),
                      if (moaref && !sendCode)
                        TextField(
                          controller: moarefId,
                          // autofocus: true,

                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'لطفا کد معرف را وارد کنید',
                            labelText: 'کد معرف:',
                            hintStyle: TextStyle(fontSize: 12),
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ),
                      if (sendCode)
                        TextField(
                          autofocus: sendCode,
                          controller: code,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'لطفا کد فعال سازی را وارد کنید',
                            labelText: ' کد فعال سازی:',
                            hintStyle: TextStyle(fontSize: 12),
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ),
                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          onPressed: () async{
                            setState(() {
                              loading = true;
                            });
                            if (sendCode == false) {
                            final value= await ApiLogin.sendCode(mobile: phoneNumber.value.text);

                                if (value != null) {
                                  setState(() {
                                    hash = value.hash!;
                                    sendCode = true;
                                  });
                                }

                            } else {
                             final value2=await ApiLogin.signIn(
                                      code: code.value.text,
                                      hash: hash,
                                      mobile: phoneNumber.value.text);

                              if (value2 != null) {

                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/home', (route) => false);
                              }
                            }
                            setState(() {
                              loading = false;
                            });

                            // if(!sendCode) {
                            //
                            //   Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                            // }
                            // Navigator.of(context).push(route)
                            print('---*-*-**-');
                          },
                          child: loading
                              ? SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(backgroundColor: Colors.indigo,))
                              : (sendCode
                                  ? Text('ورود')
                                  : Text('دریافت کد فعال سازی')),
                        ),
                      ),
                      SizedBox(height: 30,),
                      if(sendCode)
                        TextButton(onPressed: (){
                          setState(() {
                            sendCode=false;
                          });
                        }, child: Text('تغییر شماره تماس')),
                    ],
                  ),
                )
                // const Text('salam'),
                )
          ],
        ),
      ),
    );
  }
}
