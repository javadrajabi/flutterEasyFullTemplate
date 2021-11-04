import 'package:template/models/member/zarfiyat_list.dart';

/// success : "true"
/// data : [{"id":23,"user_type":1,"user_id":null,"zarfiyat_id":27,"code":"2","time":"08:00","selected_service_id":null,"type":1,"description":null,"image":null,"req_date":null,"confirm_date":null,"transaction_id":null,"attendance_status":0,"attendance_date":null,"status":0,"zarfiyat":{"id":27,"sp_id":2,"service_id":"4","shift":2,"set_date":"1400/06/31 09:27:29","date":"1400/06/31","zarfiyat":2,"reserved":0,"wait_time":"60","starttime":"08:00","endtime":"10:00","status":1}},{"id":24,"user_type":1,"user_id":"1","zarfiyat_id":27,"code":"2","time":"09:00","selected_service_id":"4","type":1,"description":null,"image":null,"req_date":"1400/06/02 15:05:39","confirm_date":"1400/06/02 15:05:39","transaction_id":null,"attendance_status":0,"attendance_date":null,"status":4,"zarfiyat":{"id":27,"sp_id":2,"service_id":"4","shift":2,"set_date":"1400/06/31 09:27:29","date":"1400/06/31","zarfiyat":2,"reserved":0,"wait_time":"60","starttime":"08:00","endtime":"10:00","status":1}}]

class ReserveList {
  ReserveList({
      this.success, 
      this.data,});

  ReserveList.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Reserve.fromJson(v));
      });
    }
  }
  String? success;
  List<Reserve>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 23
/// user_type : 1
/// user_id : null
/// zarfiyat_id : 27
/// code : "2"
/// time : "08:00"
/// selected_service_id : null
/// type : 1
/// description : null
/// image : null
/// req_date : null
/// confirm_date : null
/// transaction_id : null
/// attendance_status : 0
/// attendance_date : null
/// status : 0
/// zarfiyat : {"id":27,"sp_id":2,"service_id":"4","shift":2,"set_date":"1400/06/31 09:27:29","date":"1400/06/31","zarfiyat":2,"reserved":0,"wait_time":"60","starttime":"08:00","endtime":"10:00","status":1}

class Reserve {
  Reserve({
      this.id, 
      this.userType, 
      this.userId, 
      this.zarfiyatId, 
      this.code, 
      this.time, 
      this.selectedServiceId, 
      this.type, 
      this.description, 
      this.image, 
      this.reqDate, 
      this.confirmDate, 
      this.transactionId, 
      this.attendanceStatus, 
      this.attendanceDate, 
      this.status, 
      this.zarfiyat,});

  Reserve.fromJson(dynamic json) {
    id = json['id'];
    userType = json['user_type'];
    userId = json['user_id'];
    zarfiyatId = json['zarfiyat_id'];
    code = json['code'];
    time = json['time'];
    selectedServiceId = json['selected_service_id'];
    type = json['type'];
    description = json['description'];
    image = json['image'];
    reqDate = json['req_date'];
    confirmDate = json['confirm_date'];
    transactionId = json['transaction_id'];
    attendanceStatus = json['attendance_status'];
    attendanceDate = json['attendance_date'];
    status = json['status'];
    zarfiyat = json['zarfiyat'] != null ? Zarfiyat.fromJson(json['zarfiyat']) : null;
  }
  int? id;
  int? userType;
  dynamic userId;
  int? zarfiyatId;
  String? code;
  String? time;
  dynamic selectedServiceId;
  int? type;
  dynamic description;
  dynamic image;
  dynamic reqDate;
  dynamic confirmDate;
  dynamic transactionId;
  int? attendanceStatus;
  dynamic attendanceDate;
  int? status;
  Zarfiyat? zarfiyat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_type'] = userType;
    map['user_id'] = userId;
    map['zarfiyat_id'] = zarfiyatId;
    map['code'] = code;
    map['time'] = time;
    map['selected_service_id'] = selectedServiceId;
    map['type'] = type;
    map['description'] = description;
    map['image'] = image;
    map['req_date'] = reqDate;
    map['confirm_date'] = confirmDate;
    map['transaction_id'] = transactionId;
    map['attendance_status'] = attendanceStatus;
    map['attendance_date'] = attendanceDate;
    map['status'] = status;
    if (zarfiyat != null) {
      map['zarfiyat'] = zarfiyat?.toJson();
    }
    return map;
  }

}
