import 'dart:convert';

import 'package:template/config/config.dart';
import 'package:template/models/notifi.dart';
import 'package:template/models/status/active_session.dart';

import '../../../models/login/AllTasks.dart';
import 'package:flutter/cupertino.dart';

import '../httpRequest.dart';

class ApiUsers {
  ApiUsers._();

  static Future<ActiveSession> getActiveSession(imei) async {
    String url = "/app/active-session";
    Map? res = await HttpRequest.get(
        path: url,
        body: {'imei': imei},
        withToken: true);
    return ActiveSession.fromJson(res);
  }

  static Future removeAccess({required imeiId,required userId}) async {
    String url = "/app/remove-access";
    Map? res = await HttpRequest.get(
        path: url,
        body: {'imei_id': imeiId,'user_id':userId},
        withToken: true);
    return true;
  }
  static Future addAccess({required imeiId,required mobile}) async {
    String url = "/app/add-device-access";
    Map? res = await HttpRequest.get(
        path: url,
        body: {'imei_id': imeiId,'mobile':mobile},
        withToken: true);
    return true;
  }
  static Future<Notification_list> getNotification({required pageNumber}) async {
    String url = "/app/get-notification";
    Map? res = await HttpRequest.get(
        path: url,
        body: {'page':pageNumber},
        withToken: true);
    // List data = [];
    // json["data"].forEach((v) {
    //   data?.add(Data.fromJson(v));
    // });
    return Notification_list.fromJson(res!['notification_list']);
  }

  static Future seenNotification({required ids}) async {
    String url = "/app/seen-notification";
    Map? res = await HttpRequest.get(
        path: url,
        body: {'ids':ids},
        withToken: true);
    // List data = [];
    // json["data"].forEach((v) {
    //   data?.add(Data.fromJson(v));
    // });
    return true;
  }
  static Future sendDeviceToken(deviceToken) async {
    String url = "/app/send-device-token";
    Map? res = await HttpRequest.post(
        path: url,
        body: {'token':deviceToken},
        withToken: true);
    // List data = [];
    // json["data"].forEach((v) {
    //   data?.add(Data.fromJson(v));
    // });
    return true;
  }

}
