import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../repository.dart';
import 'error_handler.dart';

class HttpRequest {
  HttpRequest._();

  // static String token = '';

  static Future getFullURL(
      {required String path,
      Map? body,
      bool? withToken,
      Map? sheader,
      bool? showLoading}) async {
    showLoading = showLoading ?? false;
    if(showLoading){
      Repository.showLoadingAlert();
    }
    body = body ?? {};
    withToken = withToken ?? true;
    String strBody = '';
    sheader = sheader ?? {};
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
      header['Authorization'] = 'Bearer ' + Repository.deviceToken!;
    }
    if (sheader != {}) {
      sheader.forEach((key, value) {
        header[key] = value;
      });
    }

    print('*** BODY IN GET REQUEST ***');
    print(path + strBody);
    // try {
    // String encodedURL=Uri.encodeFull(Config.BaseURL + path + strBody);
    var url = Uri.parse(path + strBody);
    var response = await http.get(url, headers: header);
    if(showLoading){
      Repository.closeLoadingAlert();
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (HttpRequest.isSuccessful(response.statusCode)) {
      return response.body;
    } else {
      ErrorHandler.analize(response);
      // return Future.error(response.body);
    }

    // } catch (e) {
    //   print('--++ SERVER ERROR ++--');
    //   print(e);
    //   return Future.error({'message':'cannot connect to server.'});
    // }
  }

  static Future get(
      {required String path,
      Map? body,
      bool? withToken,
      bool? showLoading}) async {
    showLoading = showLoading ?? false;
    if(showLoading){
      Repository.showLoadingAlert();
    }
    body = body ?? {};
    withToken = withToken ?? true;
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
      header['Authorization'] = 'Bearer ' + Repository.deviceToken!;
    }

    print('*** BODY IN GET REQUEST ***');
    print(Repository.BaseURL + path + strBody);
    // try {
    // String encodedURL=Uri.encodeFull(Config.BaseURL + path + strBody);
    var url = Uri.parse(Repository.BaseURL + path + strBody);
    var response = await http.get(url, headers: header);
    if(showLoading){
      Repository.closeLoadingAlert();
    }
    print('Response status: ${response.statusCode}');
    print(Repository.BaseURL + path + strBody);
    log('Response body: ${response.body}');
    if (HttpRequest.isSuccessful(response.statusCode)) {
      return jsonDecode(response.body);
    } else {
      ErrorHandler.analize(response);
      // return Future.error(jsonDecode(response.body));
    }

    // } catch (e) {
    //   print('--++ SERVER ERROR ++--');
    //   print(e);
    //   return Future.error({'message':'cannot connect to server.'});
    // }
  }

  static Future<Map?> post(
      {required String path,
      required Map? body,
      bool? withToken,
      bool? showLoading}) async {
    showLoading = showLoading ?? false;
    if(showLoading){
      Repository.showLoadingAlert();
    }
    withToken = withToken ?? true;
    var header = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (withToken) {
      header['Authorization'] = 'Bearer ' + Repository.deviceToken!;
    }
    print('*** BODY IN POST REQUEST ***');
    print(json.encode(body));
    print(Repository.BaseURL + path);
    try {
      var url = Uri.parse(Repository.BaseURL + path);
      print(url);
      var response = await http.post(url, body: body, headers: header);
      if(showLoading){
        Repository.closeLoadingAlert();
      }
      print('Response status: ${response.statusCode}');
      // print(Repository.BaseURL + path);
      log('Response body: ${response.body}');
      if (HttpRequest.isSuccessful(response.statusCode)) {
        return jsonDecode(response.body);
      } else {
        ErrorHandler.analize(response);
        // return Future.error(jsonDecode(response.body));
      }
    } catch (e) {
      print('--++ SERVER ERROR ++--');
      print(e);
      return Future.error({'message': 'Httprequest parameter error .'});
    }
  }

  static Future postFullURL(
      {required String path,
      required Map? body,
      bool? withToken,
      Map? sheader,
        bool? showLoading}) async {
    showLoading=showLoading??false;
    if(showLoading){
      Repository.showLoadingAlert();
    }
    withToken = withToken ?? true;
    sheader = sheader ?? {};
    var header = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (withToken) {
      header['Authorization'] = 'Bearer ' + Repository.deviceToken!;
    }
    if (sheader != {}) {
      sheader.forEach((key, value) {
        header[key] = value;
      });
    }
    print('*** BODY IN POST REQUEST ***');
    print(json.encode(body));
    print(path);
    try {
      var url = Uri.parse(path);
      print(url);
      var response = await http.post(url, body: body, headers: header);
      if(showLoading){
        Repository.closeLoadingAlert();
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (HttpRequest.isSuccessful(response.statusCode)) {
        return response.body;
      } else {
        ErrorHandler.analize(response);
        // return Future.error(jsonDecode(response.body));
      }
    } catch (e) {
      print('--++ SERVER ERROR ++--');
      print(e);
      return Future.error({'message': 'cannot connect to server.'});
    }
  }

  static bool isSuccessful(code) {
    return (code >= 200 && code < 300);
    // code == 200;
  }
}

enum ResponseStatus {
  SUCCESS,
  ERROR,
  UNDEFINE,
}
