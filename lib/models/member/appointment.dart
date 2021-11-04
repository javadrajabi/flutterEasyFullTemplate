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
      int? id, 
      dynamic reqDate, 
      String? reserveDate, 
      dynamic serviceId, 
      int? status, 
      String? type, 
      dynamic description, 
      int? attendanceStatus, 
      dynamic attendanceDate, 
      int? spId, 
      dynamic userId, 
      String? userType, 
      String? time, 
      String? address, 
      String? mobile , 
      dynamic spName, 
      dynamic spImage, 
      String? attendanceStatusName, 
      String? statusName, 
      dynamic serviceName,}){
    _id = id;
    _reqDate = reqDate;
    _reserveDate = reserveDate;
    _serviceId = serviceId;
    _status = status;
    _type = type;
    _description = description;
    _attendanceStatus = attendanceStatus;
    _attendanceDate = attendanceDate;
    _spId = spId;
    _userId = userId;
    _userType = userType;
    _time = time;
    _address = address;
    _mobile  = mobile ;
    _spName = spName;
    _spImage = spImage;
    _attendanceStatusName = attendanceStatusName;
    _statusName = statusName;
    _serviceName = serviceName;
}

  Appointment.fromJson(dynamic json) {
    _id = json['id'];
    _reqDate = json['req_date'];
    _reserveDate = json['reserve_date'];
    _serviceId = json['service_id'];
    _status = json['status'];
    _type = json['type'];
    _description = json['description'];
    _attendanceStatus = json['attendance_status'];
    _attendanceDate = json['attendance_date'];
    _spId = json['sp_id'];
    _userId = json['user_id'];
    _userType = json['user_type'];
    _time = json['time'];
    _address = json['address'];
    _mobile  = json['mobile '];
    _spName = json['sp_name'];
    _spImage = json['sp_image'];
    _attendanceStatusName = json['attendance_status_name'];
    _statusName = json['status_name'];
    _serviceName = json['service_name'];
  }
  int? _id;
  dynamic _reqDate;
  String? _reserveDate;
  dynamic _serviceId;
  int? _status;
  String? _type;
  dynamic _description;
  int? _attendanceStatus;
  dynamic _attendanceDate;
  int? _spId;
  dynamic _userId;
  String? _userType;
  String? _time;
  String? _address;
  String? _mobile ;
  dynamic _spName;
  dynamic _spImage;
  String? _attendanceStatusName;
  String? _statusName;
  dynamic _serviceName;

  int? get id => _id;
  dynamic get reqDate => _reqDate;
  String? get reserveDate => _reserveDate;
  dynamic get serviceId => _serviceId;
  int? get status => _status;
  String? get type => _type;
  dynamic get description => _description;
  int? get attendanceStatus => _attendanceStatus;
  dynamic get attendanceDate => _attendanceDate;
  int? get spId => _spId;
  dynamic get userId => _userId;
  String? get userType => _userType;
  String? get time => _time;
  String? get address => _address;
  String? get mobile  => _mobile ;
  dynamic get spName => _spName;
  dynamic get spImage => _spImage;
  String? get attendanceStatusName => _attendanceStatusName;
  String? get statusName => _statusName;
  dynamic get serviceName => _serviceName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['req_date'] = _reqDate;
    map['reserve_date'] = _reserveDate;
    map['service_id'] = _serviceId;
    map['status'] = _status;
    map['type'] = _type;
    map['description'] = _description;
    map['attendance_status'] = _attendanceStatus;
    map['attendance_date'] = _attendanceDate;
    map['sp_id'] = _spId;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['time'] = _time;
    map['address'] = _address;
    map['mobile '] = _mobile ;
    map['sp_name'] = _spName;
    map['sp_image'] = _spImage;
    map['attendance_status_name'] = _attendanceStatusName;
    map['status_name'] = _statusName;
    map['service_name'] = _serviceName;
    return map;
  }

}