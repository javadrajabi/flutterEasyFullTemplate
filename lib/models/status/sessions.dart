import '../login/AllUsers.dart';

import 'Imei.dart';

/// id : 1
/// imei_id : 2
/// user_id : 2
/// created_at : "2021-06-17T19:50:32.000000Z"
/// updated_at : "2021-07-07T12:42:46.000000Z"
/// user : {"id":2,"user_type_id":2,"photo_url":null,"name":null,"comment":null,"email":null,"email_verified_at":null,"state":"1","gender":null,"mobile":"09357586173","role":"User","created_at":1623961732}
/// imei : {"id":2,"owner_id":2,"imei":"869170030108055","in":"09357586173","mid":"1235545618485","name":"talisman1","comment":"c1","type":"GPS","battery_notif":"1","caron_notif":"0","maxspeed_notif":"0","sharj_notif":"1","max_speed":120,"created_at":"2021-06-18T01:45:52.000000Z","updated_at":"2021-07-31T15:44:39.000000Z"}

class Sessions{
  int? id;
  int? imeiId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;
  Imei? imei;

  Sessions({
      this.id, 
      this.imeiId, 
      this.userId, 
      this.createdAt, 
      this.updatedAt, 
      this.user, 
      });

  Sessions.fromJson(dynamic json) {
    id = json["id"];
    imeiId = json["imei_id"];
    userId = json["user_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["imei_id"] = imeiId;
    map["user_id"] = userId;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    if (user != null) {
      map["user"] = user?.toJson();
    }
    return map;
  }

}