import 'imei.dart';
class Device {
    String? created_at;
    int? id;
    Imei? imei;
    int? imei_id;
    String? updated_at;
    int? user_id;

    Device({this.created_at, this.id, this.imei, this.imei_id, this.updated_at, this.user_id});

    factory Device.fromJson(Map json) {
        return Device(
            created_at: json['created_at'], 
            id: json['id'], 
            imei: json['imei'] != null ? Imei.fromJson(json['imei']) : null, 
            imei_id: json['imei_id'], 
            updated_at: json['updated_at'], 
            user_id: json['user_id'], 
        );
    }

    Map toJson() {
        final Map data = new Map();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['imei_id'] = this.imei_id;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        if (this.imei != null) {
            data['imei'] = this.imei!.toJson();
        }
        return data;
    }
}