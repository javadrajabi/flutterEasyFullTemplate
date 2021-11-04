import 'dart:async';
import 'package:template/data/models/member/notification_list.dart';
import 'package:template/data/models/member/profile.dart';
import '../httpRequest.dart';
class ApiNotif {
  ApiNotif._();

  static Future<NotificationList?> getNotificationList({String? page}) async {

    Map body= {"sort": "id,desc"};
    if(page!=null){
      body['page']=page;
    }else{
      body['page']='1';
    }

    String path = '/member/get-notification-list';
    Map? res = await HttpRequest.post(path: path, body: body);
    if (res != null) {
      return NotificationList.fromJson(res['data']);
    }
  }
}