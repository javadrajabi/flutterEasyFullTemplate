import 'dart:convert';

import 'package:template/models/status/DeviceList.dart';
import 'package:template/models/status/Imei.dart';
import 'package:template/models/status/LastState.dart';
import 'package:http/http.dart' as http;
import '../httpRequest.dart';

class ApiStatus {
  ApiStatus._();

  static Future<LastState> lastAssign({required String? imei}) async {
    String path = '/app/last-assign';
    Map? res = await HttpRequest.get(path: path, body: {'imei': imei},withToken: true);
    print('-------------- lastAssign ------------');
   // print(res!['Last_assign']);

    return LastState.fromJson(res!);
  }

  static Future <DeviceList> deviceList() async {
    String path = '/app/device-list';
    Map? res = await HttpRequest.get(path: path,withToken: true);
    return DeviceList.fromJson(res!) ;
  }

  static Future positionToAddress(
      {required String? lat, required String? lng})async{
   String path= 'https://api.neshan.org/v2/reverse?lat='+lat!+'&lng='+lng!;
   var header = {
     'Accept': 'application/json',
     'Api-Key':'service.2xbQz3aHG727VQFbkrR0l6MjlTP1bwfqT7ZsdsH4'
   };

   var url = Uri.parse(path);
   print(path);
   var response = await http.get(url, headers: header);
   print('Response status positionToAddress: ${response.statusCode}');
   print('Response body positionToAddress: ${response.body}');
   if(HttpRequest.isSuccessful(response.statusCode)){
     print(jsonDecode(response.body)['formatted_address']);
     String res=jsonDecode(response.body)['formatted_address'];
     print('KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK');
     return res;
   }else{
     return Future.error(jsonDecode(response.body));
   }


  }
  static Future getWeather(
      {required String? lat, required String? lng})async{

    String path=  'https://api.openweathermap.org/data/2.5/weather?lat=' +
        lat! +'&lon=' + lng! + '&appid=0e4000de3767c2c49ed8192a14f089e2';
    var header = {
      'Accept': 'application/json',
    };

    var url = Uri.parse(path);
    print(path);
    var response = await http.get(url, headers: header);
    print('Response status positionToAddress: ${response.statusCode}');
    print('Response body positionToAddress: ${response.body}');
    if(HttpRequest.isSuccessful(response.statusCode)){
      print(jsonDecode(response.body));
      Map res=jsonDecode(response.body);
      return res;
    }else{
      return Future.error(jsonDecode(response.body));
    }


  }

  static Future resetDevice({required String imei}) async {
    String path = '/app/reset-device';
    Map? res = await HttpRequest.get(path: path, body: {'imei': imei},withToken: true);
    print('-------------- lastAssign ------------'+res.toString());
    // print(res!['Last_assign']);
    return true;
  }
  static Future smsNotificationSetting({required String imei,required String text}) async {
    String path = '/app/sms-notification-setting';
    Map? res = await HttpRequest.get(path: path, body: {'imei': imei,'text':text},withToken: true);
    print('-------------- smsNotificationSetting ------------'+res.toString());
    // print(res!['Last_assign']);
    return true;
  }
  static Future<Imei> appNotificationSetting({required String imei,required String text,String? speed}) async {
    String path = '/app/app-notification-setting';
   Map body= {'imei': imei,'text':text};
   if(speed!=null){
     body['speed']=speed;
   }
    Map? res = await HttpRequest.get(path: path, body: body,withToken: true);
    print('-------------- appNotificationSetting ------------'+res.toString());
    // print(res!['Last_assign']);
    return Imei.fromJson(res!['result']);
  }
  static Future changeSecurity({required String imei,required String status}) async {
    String path = '/app/change-security';
    print({'imei': imei,'status':status});
    Map? res = await HttpRequest.get(path: path, body: {'imei': imei,'status':status},withToken: true);

    print('-------------- changeSecurity ------------'+res.toString());
    // print(res!['Last_assign']);
    return true;
  }

  static Future changePower({required String imei,required String status}) async {
    String path = '/app/change-power';
    Map? res = await HttpRequest.get(path: path, body: {'imei': imei,'status':status},withToken: true);
    print('-------------- changePower ------------'+res.toString());
    // print(res!['Last_assign']);
    return true;
  }
  static Future renameDevice({required String imei,required String name}) async {
    String path = '/app/rename-device';
    Map? res = await HttpRequest.get(path: path, body: {'imei': imei,'name':name},withToken: true);
    print('-------------- renameDevice ------------'+res.toString());
    // print(res!['Last_assign']);
    return true;
  }
}
