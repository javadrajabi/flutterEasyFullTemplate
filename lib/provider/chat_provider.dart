import 'package:template/data/webService/requests/chat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template/data/models/member/services_list.dart';
import 'package:template/data/models/message_list.dart';

class ChatP with ChangeNotifier {
  List<Message> userInChat = [];

  getUsersInMessage() {
    print('getUsersInMessage');
    ApiChat.getUsersInMessage().then((value) {
      userInChat = value?.data ?? [];
      notifyListeners();
    });
  }


}
