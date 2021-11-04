import 'dart:async';
import 'package:template/data/models/member/notification_list.dart';
import 'package:template/data/models/member/profile.dart';
import 'package:template/data/models/member/services_list.dart';
import 'package:template/data/models/message_list.dart';
import '../httpRequest.dart';
class ApiChat {
  ApiChat._();

  static Future<Message?> sendMessage({
    required String receiver_user_id,
    required String message,
    required String receiver_type}) async {

    Map body= {
      "receiver_user_id":receiver_user_id,
      "message":message,
      "receiver_type":receiver_type};

    String path = '/member/send-message';
    Map? res = await HttpRequest.post(path: path, body: body);
    if (res != null) {
      return Message.fromJson(res['data']);
    }
  }
  static Future<MessageList?> getMessagesList({required String parentId}) async {
    Map body={
      "parent_id": parentId
    };

    String path = '/member/get-messages-list';
    Map? res = await HttpRequest.post(path: path, body: body);
    if (res != null) {
      return MessageList.fromJson(res);
    }
  }
  static Future<MessageList?> getUsersInMessage() async {

    String path = '/member/get-users-in-message';
    Map? res = await HttpRequest.post(path: path, body: {});
    if (res != null) {
      return MessageList.fromJson(res);
    }
  }
  static Future<ServicesList?> getAllServicesList() async {

    String path = '/member/get-all-services-list';
    Map? res = await HttpRequest.post(path: path, body: {},showLoading: true);
    if (res != null) {
      return ServicesList.fromJson(res['data']);
    }
  }
}