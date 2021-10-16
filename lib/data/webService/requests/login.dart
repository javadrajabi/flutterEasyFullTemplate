import 'dart:async';

import '../../../provider/baseVar.dart';

import '../httpRequest.dart';
import '../../webService/apiReponse.dart';
import 'package:flutter/material.dart';
import '../../../models/status/Verification.dart';
import '../../../models/login/VerifyCode.dart';
import '../../../models/login/UserData.dart';
import 'package:http/http.dart';

class ApiLogin {
  ApiLogin._();

  static Future<Verification?> phoneVerification(
      {required String mobile}) async {
    String path = '/auth/sendcode';
    Map? res = await HttpRequest.post(path: path, body: {'mobile': mobile});
    if (res != null) {
      if(res['status_code']=='OK'){
        return Verification.fromJson(res);
      }else{
        return Future.error(res['status_message']);
      }
    } else {
      return null;
    }
  }

  static Future<VerifyCode?> verifyCode(
      {String? mobile, String? hash, String? code}) async {

    String path = '/auth/signin';
    bool haveError=false;
    Map? res = await HttpRequest.post(
        path: path, body: {'mobile': mobile, 'hash': hash, 'code': code}).onError((error, stackTrace)  {
      haveError=true;

    });

    if (haveError != true) {
        return VerifyCode.fromJson(res!);
      } else {
        return Future.error(res!['message']);
      }

  }

  static Future<VerifyCode?> signUp(
      {String? mobile,
      String? hash,
      String? code,
      String? gender,
      String? firstname,
      String? lastname}) async {
    String path = '/auth.signUp';
    Map? res = await HttpRequest.post(path: path, body: {
      'mobile': mobile,
      'hash': hash,
      'code': code,
      'gender': gender,
      'firstname': firstname,
      'lastname': lastname
    });
    if (res != null) {
      BaseVar.userData = VerifyCode.fromJson(res);
      HttpRequest.token = BaseVar.userData.access_token!;
      return BaseVar.userData;
    } else {
      return null;
    }
  }

  static Future<UserData?> signOut(context) async {
    String path = '/auth.signOut';

    await HttpRequest.get(path: path);

    Navigator.of(context).pushNamed('/login');
  }
}
