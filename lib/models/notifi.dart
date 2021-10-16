import 'dart:convert';

/// status : "OK"
/// notification_list : {"current_page":2,"data":[{"imeiName":"talisman1","id":1,"text":"سرعت بیش از حد مجاز تعیین شده","color":"red","icon":"battery","notification_text_id":3,"imei_id":2,"seen":"1","comment":null,"created_at":null,"updated_at":null},{"imeiName":"talisman1","id":2,"text":"بانری خودرو قطع شد","color":"red","icon":"battery","notification_text_id":1,"imei_id":2,"seen":"0","comment":null,"created_at":null,"updated_at":null}],"first_page_url":"http://vesga.local/api/1.0/app/get-notification?page=1","from":3,"next_page_url":"http://vesga.local/api/1.0/app/get-notification?page=3","path":"http://vesga.local/api/1.0/app/get-notification","per_page":2,"prev_page_url":"http://vesga.local/api/1.0/app/get-notification?page=1","to":4}

class Notifi {
  String? status;
  Notification_list? notificationList;

  Notifi({
      this.status, 
      this.notificationList});

  Notifi.fromJson(dynamic json) {
    status = json["status"];
    notificationList = json["notification_list"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["notification_list"] = notificationList;
    return map;
  }

}

/// current_page : 2
/// data : [{"imeiName":"talisman1","id":1,"text":"سرعت بیش از حد مجاز تعیین شده","color":"red","icon":"battery","notification_text_id":3,"imei_id":2,"seen":"1","comment":null,"created_at":null,"updated_at":null},{"imeiName":"talisman1","id":2,"text":"بانری خودرو قطع شد","color":"red","icon":"battery","notification_text_id":1,"imei_id":2,"seen":"0","comment":null,"created_at":null,"updated_at":null}]
/// first_page_url : "http://vesga.local/api/1.0/app/get-notification?page=1"
/// from : 3
/// next_page_url : "http://vesga.local/api/1.0/app/get-notification?page=3"
/// path : "http://vesga.local/api/1.0/app/get-notification"
/// per_page : 2
/// prev_page_url : "http://vesga.local/api/1.0/app/get-notification?page=1"
/// to : 4

class Notification_list {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;

  Notification_list({
      this.currentPage, 
      this.data, 
      this.firstPageUrl, 
      this.from, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to});

  Notification_list.fromJson(dynamic json) {
    currentPage = json["current_page"];
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["current_page"] = currentPage;
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    map["first_page_url"] = firstPageUrl;
    map["from"] = from;
    map["next_page_url"] = nextPageUrl;
    map["path"] = path;
    map["per_page"] = perPage;
    map["prev_page_url"] = prevPageUrl;
    map["to"] = to;
    return map;
  }

}

/// imeiName : "talisman1"
/// id : 1
/// text : "سرعت بیش از حد مجاز تعیین شده"
/// color : "red"
/// icon : "battery"
/// notification_text_id : 3
/// imei_id : 2
/// seen : "1"
/// comment : null
/// created_at : null
/// updated_at : null

class Data {
  String? imeiName;
  int? id;
  String? text;
  String? color;
  String? icon;
  int? notificationTextId;
  int? imeiId;
  String? seen;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Data({
      this.imeiName, 
      this.id, 
      this.text, 
      this.color, 
      this.icon, 
      this.notificationTextId, 
      this.imeiId, 
      this.seen, 
      this.comment, 
      this.createdAt, 
      this.updatedAt});

  Data.fromJson(dynamic json) {
    imeiName = json["imeiName"];
    id = json["id"];
    text = json["text"];
    color = json["color"];
    icon = json["icon"];
    notificationTextId = json["notification_text_id"];
    imeiId = json["imei_id"];
    seen = json["seen"];
    comment = json["comment"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imeiName"] = imeiName;
    map["id"] = id;
    map["text"] = text;
    map["color"] = color;
    map["icon"] = icon;
    map["notification_text_id"] = notificationTextId;
    map["imei_id"] = imeiId;
    map["seen"] = seen;
    map["comment"] = comment;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    return map;
  }

}