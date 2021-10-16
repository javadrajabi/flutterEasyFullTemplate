import 'sessions.dart';

/// status : "OK"
/// Sessions : [{"id":1,"imei_id":2,"user_id":2,"created_at":"2021-06-17T19:50:32.000000Z","updated_at":"2021-07-07T12:42:46.000000Z","user":{"id":2,"user_type_id":2,"photo_url":null,"name":null,"comment":null,"email":null,"email_verified_at":null,"state":"1","gender":null,"mobile":"09357586173","role":"User","created_at":1623961732},"imei":{"id":2,"owner_id":2,"imei":"869170030108055","in":"09357586173","mid":"1235545618485","name":"talisman1","comment":"c1","type":"GPS","battery_notif":"1","caron_notif":"0","maxspeed_notif":"0","sharj_notif":"1","max_speed":120,"created_at":"2021-06-18T01:45:52.000000Z","updated_at":"2021-07-31T15:44:39.000000Z"}},{"id":3,"imei_id":2,"user_id":1,"created_at":"2021-07-26T20:15:24.000000Z","updated_at":"2021-07-26T20:15:24.000000Z","user":{"id":1,"user_type_id":1,"photo_url":null,"name":"Admin Admin","comment":null,"email":null,"email_verified_at":null,"state":"1","gender":null,"mobile":"09119541821","role":"Admin","created_at":1623961732},"imei":{"id":2,"owner_id":2,"imei":"869170030108055","in":"09357586173","mid":"1235545618485","name":"talisman1","comment":"c1","type":"GPS","battery_notif":"1","caron_notif":"0","maxspeed_notif":"0","sharj_notif":"1","max_speed":120,"created_at":"2021-06-18T01:45:52.000000Z","updated_at":"2021-07-31T15:44:39.000000Z"}}]

class ActiveSession {
  String? status;
  List<Sessions>? sessions;

  ActiveSession({
      this.status, 
      this.sessions});

  ActiveSession.fromJson(dynamic json) {
    status = json["status"];
    if (json["Sessions"] != null) {
      sessions = [];
      json["Sessions"].forEach((v) {
        sessions?.add(Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    if (sessions != null) {
      map["Sessions"] = sessions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}