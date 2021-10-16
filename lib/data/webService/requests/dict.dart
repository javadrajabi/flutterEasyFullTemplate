import 'dart:convert';
import 'dart:developer';
import 'dart:convert' show utf8;

import 'package:template/models/status/Imei.dart';
import '../httpRequest.dart';

class ApiDict {
  ApiDict._();

  static String getBetweenString(
      {required text, required start, required end}) {
    // const str = "the quick brown fox jumps over the lazy dog";
    // const start = "quick";
    // const end = "over";

    final startIndex = text.indexOf(start);
    final endIndex = text.indexOf(end, (startIndex + start.length).toInt());
    print(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDWDWFEG');
    print(startIndex);
    print(endIndex);
    return text.substring((startIndex + start.length).toInt(), endIndex);
  }

  static Future<List> GuessTheWordAbadis(String exp) async {
    String url = "https://abadis.ir/ajaxcmd/getaclist/";
    String? res = await HttpRequest.getFullURL(
        path: url, body: {'exp': exp}, withToken: false);
    if (res!.contains(':<div>')) {
      return [];
    } else {
      res = res.replaceAll("<i class='ico icoSr'></i>", ",");
      res = res.replaceAll("<span>", "");
      res = res.replaceAll("</span>", "");
      res = res.replaceAll(":", "");

      var ress = jsonDecode(res).split(',');
      ress.removeLast();
      return ress;
    }
  }


  static Future<List> GuessTheWordFastDict(String exp) async {
    String url = "https://fastdic.com/suggestions?word=" + exp;
    String? res = await HttpRequest.postFullURL(
        path: url,
        body: {},
        sheader: {"referer": "https://fastdic.com"},
        withToken: false);
// log(jsonDecode(res??''));
    return jsonDecode(res ?? '');
  }


  static Future<Imei> removePolygon(imei) async {
    String url = "/app/remove-polygon";
    Map? res =
        await HttpRequest.get(path: url, body: {'imei': imei}, withToken: true);
    return Imei.fromJson(res!['imei']);
  }
}
