import '../../../models/login/AllUsers.dart';
import '../../../models/login/UserData.dart';

import '../../data/webService/httpRequest.dart';
import 'package:flutter/material.dart';

class UsersP with ChangeNotifier {
  AllUsers users= AllUsers();


  Future<void> getUsers() async {
    String url = '/user.getUsers';
    HttpRequest.post(
        path: url, body: {}, withToken: true).then((
        res) {
      users=AllUsers.fromJson(res!);
      notifyListeners();
      // tasks=
    });
    // tasks= Projects.fromJson(res);

  }
}