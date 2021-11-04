import 'package:template/models/member/profile.dart';

/// id : 13
/// user_id : 96
/// user_type : 2
/// issued_in : "1634733305"
/// expires_in : "1637325305"
/// token_access : "d7e0ec7b9959daef1550e6f710c18d52a53195e522f0a155a339b280d4173d526676c81834072d0418042178743d704a4ccd0a64e09e0570483df453572c67df"
/// status : "1"
/// user : {"id":96,"sp_id":2,"code":null,"fname":null,"lname":null,"gender":"0","job":null,"gradeid":null,"father":null,"shsh":null,"birthloc":null,"birthday":null,"codemeli":null,"mobile":"09357586173","tel":null,"email":null,"image":null,"countrycode":null,"ostancode":null,"shahrestancode":null,"address":null,"codeposti":null,"activationcode":null,"activationdate":null,"activationsendcount":null,"activationsendtime":null,"moaref":null,"secquestionid":null,"secresponse":null,"portalid":2,"device_id":null,"receive_notifications":1,"regdate":"","status":"1","temp":null}

class Verify {
  Verify({
      this.id, 
      this.userId, 
      this.userType, 
      this.issuedIn, 
      this.expiresIn, 
      this.tokenAccess, 
      this.status, 
      this.user,});

  Verify.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    userType = json['user_type'];
    issuedIn = json['issued_in'];
    expiresIn = json['expires_in'];
    tokenAccess = json['token_access'];
    status = json['status'];
    user = json['user'] != null ? Profile.fromJson(json['user']) : null;
  }
  int? id;
  int? userId;
  int? userType;
  String? issuedIn;
  String? expiresIn;
  String? tokenAccess;
  String? status;
  Profile? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['user_type'] = userType;
    map['issued_in'] = issuedIn;
    map['expires_in'] = expiresIn;
    map['token_access'] = tokenAccess;
    map['status'] = status;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}
