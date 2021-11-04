import 'package:flutter/material.dart';
import 'package:template/data/webService/requests/member.dart';
import 'package:template/data/webService/requests/notif.dart';
import 'package:template/data/models/member/notification_list.dart';

class NotifP with ChangeNotifier {

  List<Notif>? notifList;

  getNotifList({String? page}) {
    print('getProfile');
    ApiNotif.getNotificationList(page: page).then((value) {
      notifList = value!.data;
      notifyListeners();
    });
  }

}
