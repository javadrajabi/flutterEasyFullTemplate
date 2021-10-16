import 'dart:convert';

class Imei {
  String? comment;
  String? created_at;
  int? id;
  String? imei;
  String? mid;
  String? name;
  String? In;
  String? battery_notif;
  String? caron_notif;
  String? maxspeed_notif;
  String? sharj_notif;
  int? max_speed;
  int? owner_id;
  String? type;
  List? polygon;
  String? updated_at;

  Imei(
      {this.comment,
      this.battery_notif,
      this.caron_notif,
      this.sharj_notif,
      this.maxspeed_notif,
      this.max_speed,
      this.In,
      this.created_at,
      this.id,
      this.imei,
      this.mid,
      this.name,
      this.polygon,
      this.owner_id,
      this.type,
      this.updated_at});

  factory Imei.fromJson(Map json) {
    return Imei(
      comment: json['comment'],
      created_at: json['created_at'],
      id: json['id'],
      imei: json['imei'],
      mid: json['mid'],
      In: json['in'],
      name: json['name'],
      polygon:json['polygon']!= null ?jsonDecode(json['polygon']) :null,
      owner_id: json['owner_id'],
      type: json['type'],
      battery_notif: json['battery_notif'],
      caron_notif: json['caron_notif'],
      maxspeed_notif: json['maxspeed_notif'],
      sharj_notif: json['sharj_notif'],
      max_speed: maxspeedpars(json),
      updated_at: json['updated_at'],
    );
  }

  static maxspeedpars(json) {
    int fu = 0;
    try {
      fu = int.parse(json['max_speed']);
    } catch (e) {
      fu = json['max_speed'];
    }
    return fu;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['created_at'] = this.created_at;
    data['id'] = this.id;
    data['in'] = this.In;
    data['imei'] = this.imei;
    data['mid'] = this.mid;
    data['name'] = this.name;
    data['owner_id'] = this.owner_id;
    data['polygon'] =this.polygon!= null?jsonEncode(this.polygon):null ;
    data['type'] = this.type;
    data['battery_notif'] = this.battery_notif;
    data['max_speed'] = this.max_speed;
    data['maxspeed_notif'] = this.maxspeed_notif;
    data['caron_notif'] = this.caron_notif;
    data['sharj_notif'] = this.sharj_notif;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
