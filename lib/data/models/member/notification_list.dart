/// current_page : 1
/// data : [{"id":15,"sender":1,"receiver":33,"sender_type":1,"receiver_type":2,"subject":null,"details":"کاربر گرامی، نوبت شما برای تاریخ 1400/05/07 ساعت 09:00 لغو شد. با تشکر .","is_read":0,"status":0,"created_at":"1400-06-01T15:40:46.000000Z","updated_at":"1400-06-01T15:40:46.000000Z"},{"id":4,"sender":6,"receiver":33,"sender_type":2,"receiver_type":2,"subject":"لغو نوبت","details":"کاربر گرامی نوبت 1400/04/17 شما از طرف خدمت دهنده لغو شد.","is_read":0,"status":1,"created_at":"1400-04-17T13:47:37.000000Z","updated_at":"1400-04-17T13:47:37.000000Z"}]
/// first_page_url : "http://lumen.local/member/get-notification-list?page=1"
/// from : 1
/// next_page_url : null
/// path : "http://lumen.local/member/get-notification-list"
/// per_page : 5
/// prev_page_url : null
/// to : 2

class NotificationList {
  NotificationList({
      this.currentPage, 
      this.data, 
      this.firstPageUrl, 
      this.from, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to,});

  NotificationList.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Notif.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }
  int? currentPage;
  List<Notif>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    return map;
  }

}

/// id : 15
/// sender : 1
/// receiver : 33
/// sender_type : 1
/// receiver_type : 2
/// subject : null
/// details : "کاربر گرامی، نوبت شما برای تاریخ 1400/05/07 ساعت 09:00 لغو شد. با تشکر ."
/// is_read : 0
/// status : 0
/// created_at : "1400-06-01T15:40:46.000000Z"
/// updated_at : "1400-06-01T15:40:46.000000Z"

class Notif {
  Notif({
      this.id, 
      this.sender, 
      this.receiver, 
      this.senderType, 
      this.receiverType, 
      this.subject, 
      this.details, 
      this.isRead, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Notif.fromJson(dynamic json) {
    id = json['id'];
    sender = json['sender'];
    receiver = json['receiver'];
    senderType = json['sender_type'];
    receiverType = json['receiver_type'];
    subject = json['subject'];
    details = json['details'];
    isRead = json['is_read'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? sender;
  int? receiver;
  int? senderType;
  int? receiverType;
  dynamic subject;
  String? details;
  int? isRead;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sender'] = sender;
    map['receiver'] = receiver;
    map['sender_type'] = senderType;
    map['receiver_type'] = receiverType;
    map['subject'] = subject;
    map['details'] = details;
    map['is_read'] = isRead;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}