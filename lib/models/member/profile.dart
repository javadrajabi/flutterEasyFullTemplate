/// id : 33
/// ostancode : null
/// shahrestancode : null
/// sp_id : 2
/// fname : null
/// lname : null
/// mobile : "09357586173"
/// email : null
/// moaref : null
/// image : null
/// birthday : null
/// receive_notifications : 1
/// user_type : 2
/// ostan : null
/// shahrestan : null
/// message_count : 0
/// notification_count : 0

class Profile {
  Profile({
      int? id, 
      dynamic ostancode, 
      dynamic shahrestancode, 
      int? spId, 
      dynamic fname, 
      dynamic lname, 
      String? mobile, 
      dynamic email, 
      dynamic moaref, 
      dynamic image, 
      dynamic birthday, 
      int? receiveNotifications, 
      int? userType, 
      dynamic ostan, 
      dynamic shahrestan, 
      int? messageCount, 
      int? notificationCount,}){
    _id = id;
    _ostancode = ostancode;
    _shahrestancode = shahrestancode;
    _spId = spId;
    _fname = fname;
    _lname = lname;
    _mobile = mobile;
    _email = email;
    _moaref = moaref;
    _image = image;
    _birthday = birthday;
    _receiveNotifications = receiveNotifications;
    _userType = userType;
    _ostan = ostan;
    _shahrestan = shahrestan;
    _messageCount = messageCount;
    _notificationCount = notificationCount;
}

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _ostancode = json['ostancode'];
    _shahrestancode = json['shahrestancode'];
    _spId = json['sp_id'];
    _fname = json['fname'];
    _lname = json['lname'];
    _mobile = json['mobile'];
    _email = json['email'];
    _moaref = json['moaref'];
    _image = json['image'];
    _birthday = json['birthday'];
    _receiveNotifications = json['receive_notifications'];
    _userType = json['user_type'];
    _ostan = json['ostan'];
    _shahrestan = json['shahrestan'];
    _messageCount = json['message_count'];
    _notificationCount = json['notification_count'];
  }
  int? _id;
  dynamic _ostancode;
  dynamic _shahrestancode;
  int? _spId;
  dynamic _fname;
  dynamic _lname;
  String? _mobile;
  dynamic _email;
  dynamic _moaref;
  dynamic _image;
  dynamic _birthday;
  int? _receiveNotifications;
  int? _userType;
  dynamic _ostan;
  dynamic _shahrestan;
  int? _messageCount;
  int? _notificationCount;

  int? get id => _id;
  dynamic get ostancode => _ostancode;
  dynamic get shahrestancode => _shahrestancode;
  int? get spId => _spId;
  dynamic get fname => _fname;
  dynamic get lname => _lname;
  String? get mobile => _mobile;
  dynamic get email => _email;
  dynamic get moaref => _moaref;
  dynamic get image => _image;
  dynamic get birthday => _birthday;
  int? get receiveNotifications => _receiveNotifications;
  int? get userType => _userType;
  dynamic get ostan => _ostan;
  dynamic get shahrestan => _shahrestan;
  int? get messageCount => _messageCount;
  int? get notificationCount => _notificationCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ostancode'] = _ostancode;
    map['shahrestancode'] = _shahrestancode;
    map['sp_id'] = _spId;
    map['fname'] = _fname;
    map['lname'] = _lname;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['moaref'] = _moaref;
    map['image'] = _image;
    map['birthday'] = _birthday;
    map['receive_notifications'] = _receiveNotifications;
    map['user_type'] = _userType;
    map['ostan'] = _ostan;
    map['shahrestan'] = _shahrestan;
    map['message_count'] = _messageCount;
    map['notification_count'] = _notificationCount;
    return map;
  }

}