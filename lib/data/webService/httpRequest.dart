import 'dart:convert';
import '../../../models/login/UserData.dart';
import '../../../provider/baseVar.dart';

import '../webService/apiReponse.dart';
import 'package:flutter/cupertino.dart';
import '../../config/config.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  HttpRequest._();

  static String token = '';

  static Future getFullURL({required String path, Map? body, bool? withToken,Map? sheader}) async {
    body = body ?? {};
    withToken = withToken ?? false;
    String strBody = '';
    sheader=sheader?? {};
    body.forEach((key, value) {
      strBody = strBody + key + '=' + value + '&';
      print(strBody);
    });
    if (strBody != '') {
      strBody = strBody.substring(0, strBody.length - 1);
      strBody = '?' + strBody;
    }

    var header = {
      'Accept': 'application/json',
    };
    if (withToken) {
      header['Authorization'] = 'Bearer $token';
    }
    if(sheader != {}){
      sheader.forEach((key, value) {
        header[key]=value;
    });
    }

    print('*** BODY IN GET REQUEST ***');
    print(path + strBody);
    // try {
    // String encodedURL=Uri.encodeFull(Config.BaseURL + path + strBody);
    var url = Uri.parse( path + strBody);
    var response = await http.get(url, headers: header);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (HttpRequest.isSuccessful(response.statusCode)) {
      return response.body;
    } else {
      return Future.error(response.body);
    }

    // } catch (e) {
    //   print('--++ SERVER ERROR ++--');
    //   print(e);
    //   return Future.error({'message':'cannot connect to server.'});
    // }
  }
  static Future get({required String path, Map? body, bool? withToken}) async {
    body = body ?? {};
    withToken = withToken ?? false;
    String strBody = '';
    body.forEach((key, value) {
      strBody = strBody + key + '=' + value + '&';
      print(strBody);
    });
    if (strBody != '') {
      strBody = strBody.substring(0, strBody.length - 1);
      strBody = '?' + strBody;
    }

    var header = {
      'Accept': 'application/json',
    };
    if (withToken) {
      header['Authorization'] = 'Bearer $token';
    }

    print('*** BODY IN GET REQUEST ***');
    print(Config.BaseURL + path + strBody);
    // try {
    // String encodedURL=Uri.encodeFull(Config.BaseURL + path + strBody);
    var url = Uri.parse(Config.BaseURL + path + strBody);
    var response = await http.get(url, headers: header);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (HttpRequest.isSuccessful(response.statusCode)) {
      return jsonDecode(response.body);
    } else {
      return Future.error(jsonDecode(response.body));
    }

    // } catch (e) {
    //   print('--++ SERVER ERROR ++--');
    //   print(e);
    //   return Future.error({'message':'cannot connect to server.'});
    // }
  }
  static Future<Map?> post(
      {required String path, required Map? body, bool? withToken}) async {
    withToken = withToken ?? false;
    var header = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (withToken) {
      header['Authorization'] = 'Bearer $token';
    }
    print('*** BODY IN POST REQUEST ***');
    print(json.encode(body));
    print(Config.BaseURL + path);
    try {
      var url = Uri.parse(Config.BaseURL + path);
      print(url);
      var response = await http.post(url, body: body, headers: header);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (HttpRequest.isSuccessful(response.statusCode)) {
        return jsonDecode(response.body);
      } else {
        return Future.error(jsonDecode(response.body));
      }
    } catch (e) {
      print('--++ SERVER ERROR ++--');
      print(e);
      return Future.error({'message': 'cannot connect to server.'});
    }
  }
  static Future postFullURL(
      {required String path, required Map? body, bool? withToken,Map? sheader}) async {
    withToken = withToken ?? false;
    sheader=sheader?? {};
    var header = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (withToken) {
      header['Authorization'] = 'Bearer $token';
    }
    if(sheader != {}){
      sheader.forEach((key, value) {
        header[key]=value;
      });
    }
    print('*** BODY IN POST REQUEST ***');
    print(json.encode(body));
    print( path);
    try {
      var url = Uri.parse(path);
      print(url);
      var response = await http.post(url, body: body, headers: header);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (HttpRequest.isSuccessful(response.statusCode)) {
        return response.body;
      } else {
        return Future.error(jsonDecode(response.body));
      }
    } catch (e) {
      print('--++ SERVER ERROR ++--');
      print(e);
      return Future.error({'message': 'cannot connect to server.'});
    }
  }

  static bool isSuccessful(code) {
    return
        // (code >= 200 && code < 300) ||
        code == 200;
  }
}

enum ResponseStatus {
  SUCCESS,
  ERROR,
  UNDEFINE,
}
