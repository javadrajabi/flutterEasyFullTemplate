/// success : "true"
/// data : [{"id":22,"req_date":null,"reserve_date":"1400/05/06","service_id":null,"status":0,"type":"mamoli","description":null,"attendance_status":0,"attendance_date":null,"sp_id":6,"user_id":null,"user_type":"user(member)","time":"09:00","address":"ساری، کمربندی غربی، حدفاصل میدان امام و خزر، جنب موسسه قرض الحسنه محمد رسول الله، شرکت درنیکا","mobile ":"09374498573","sp_name":null,"sp_image":null,"attendance_status_name":"نامشخص","status_name":"آزاد","service_name":null}]

class AppointmentList {
  AppointmentList({
      this.success, 
      this.data,});

  AppointmentList.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Appointment.fromJson(v));
      });
    }
  }
  String? success;
  List<Appointment>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 22
/// req_date : null
/// reserve_date : "1400/05/06"
/// service_id : null
/// status : 0
/// type : "mamoli"
/// description : null
/// attendance_status : 0
/// attendance_date : null
/// sp_id : 6
/// user_id : null
/// user_type : "user(member)"
/// time : "09:00"
/// address : "ساری، کمربندی غربی، حدفاصل میدان امام و خزر، جنب موسسه قرض الحسنه محمد رسول الله، شرکت درنیکا"
/// mobile  : "09374498573"
/// sp_name : null
/// sp_image : null
/// attendance_status_name : "نامشخص"
/// status_name : "آزاد"
/// service_name : null

class Appointment {
  Appointment({
      this.id, 
      this.reqDate, 
      this.reserveDate, 
      this.serviceId, 
      this.status, 
      this.type, 
      this.description, 
      this.attendanceStatus, 
      this.attendanceDate, 
      this.spId, 
      this.userId, 
      this.userType, 
      this.time, 
      this.address, 
      this.mobile , 
      this.spName, 
      this.spImage, 
      this.attendanceStatusName, 
      this.statusName, 
      this.serviceName,});

  Appointment.fromJson(dynamic json) {
    id = json['id'];
    reqDate = json['req_date'];
    reserveDate = json['reserve_date'];
    serviceId = json['service_id'];
    status = json['status'];
    type = json['type'];
    description = json['description'];
    attendanceStatus = json['attendance_status'];
    attendanceDate = json['attendance_date'];
    spId = json['sp_id'];
    userId = json['user_id'];
    userType = json['user_type'];
    time = json['time'];
    address = json['address'];
    mobile  = json['mobile'];
    spName = json['sp_name'];
    spImage = json['sp_image'];
    attendanceStatusName = json['attendance_status_name'];
    statusName = json['status_name'];
    serviceName = json['service_name'];
  }
  int? id;
  dynamic reqDate;
  String? reserveDate;
  dynamic serviceId;
  int? status;
  String? type;
  dynamic description;
  int? attendanceStatus;
  dynamic attendanceDate;
  int? spId;
  dynamic userId;
  String? userType;
  String? time;
  String? address;
  String? mobile ;
  dynamic spName;
  dynamic spImage;
  String? attendanceStatusName;
  String? statusName;
  dynamic serviceName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['req_date'] = reqDate;
    map['reserve_date'] = reserveDate;
    map['service_id'] = serviceId;
    map['status'] = status;
    map['type'] = type;
    map['description'] = description;
    map['attendance_status'] = attendanceStatus;
    map['attendance_date'] = attendanceDate;
    map['sp_id'] = spId;
    map['user_id'] = userId;
    map['user_type'] = userType;
    map['time'] = time;
    map['address'] = address;
    map['mobile'] = mobile ;
    map['sp_name'] = spName;
    map['sp_image'] = spImage;
    map['attendance_status_name'] = attendanceStatusName;
    map['status_name'] = statusName;
    map['service_name'] = serviceName;
    return map;
  }

}