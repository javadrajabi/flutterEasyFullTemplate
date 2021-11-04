import 'dart:async';
import 'package:template/data/models/login/verify.dart';
import '../../repository.dart';
import '../httpRequest.dart';
import 'package:flutter/material.dart';
import '../../../data/models/login/Verification.dart';
import '../../../data/models/login/UserData.dart';

class ApiLogin {
  ApiLogin._();

  static Future<Verification?> sendCode(
      {required String mobile}) async {
    String path = '/user/send-code';
    Map? res = await HttpRequest.post(path: path, body: {'mobile-number': mobile},withToken: false);
    if (res != null) {
        return Verification.fromJson(res['data']);
    }
  }

  static Future<Verify?> signIn(
      {String? mobile, String? hash, String? code}) async {
    String path = '/user/login';
    Map? res = await HttpRequest.post(
        path: path, body: {'mobile-number': mobile, 'hash': hash, 'code': code},withToken: false);
    if (res != null && res['success']=="true") {
      Repository.saveToken(res['data']['token_access']);
      return Verify.fromJson(res['data']);
    }

  }

  static Future<UserData?> signOut(context) async {
    String path = '/auth.signOut';

    await HttpRequest.get(path: path,withToken: false);

    Navigator.of(context).pushNamed('/login');
  }
}
