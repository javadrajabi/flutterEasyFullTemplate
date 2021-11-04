
import 'package:template/models/status/Imei.dart';


import '../httpRequest.dart';

class ApiMap {
  ApiMap._();

  static Future<Imei> setPolygon(imei,String polygon) async {
    String url = "/app/set-polygon";
    Map? res = await HttpRequest.post(
        path: url,
        body: {'imei': imei,'polygon':polygon},
        withToken: true);
    return Imei.fromJson(res!['imei']);
  }
  static Future<Imei> removePolygon(imei) async {
    String url = "/app/remove-polygon";
    Map? res = await HttpRequest.get(
        path: url,
        body: {'imei': imei},
        withToken: true);
    return Imei.fromJson(res!['imei']);
  }

}
