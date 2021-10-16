import 'dart:convert';
import 'package:http/http.dart';

class ApiResponse {
   ApiResponse(Response response) {
    code = response.statusCode;
    body = jsonDecode(response.body);
    if(body!['status_code']=="OK"){
      status=ResponseStatus.OK;
    }else{
      status=ResponseStatus.ERROR;
      statusMessage=body!['status_message'];
    }
    // if (isSuccessful()) {
    //
    //   errorMessage = '';
    // } else {
    //   body = null;
    //   final dynamic hashMap = json.decode(response.body);
    //   print(hashMap['status_message']);
    //   errorMessage = hashMap['status_message'];
    // }
  }
  int? code;
  Map? body;
  ResponseStatus? status;
  String? statusMessage;

  bool isSuccessful() {
    return code! >= 200 && code! < 300 ;
  }
}
enum ResponseStatus {
  OK,
  ERROR,
  UNDEFINE,
}