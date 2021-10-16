import 'Device.dart';
class DeviceList {
    List<Device>? device_list;
    String? status;

    DeviceList({this.device_list, this.status});

    factory DeviceList.fromJson(Map json) {
        return DeviceList(
            device_list: json['device_list'] != null ? (json['device_list'] as List).map((i) => Device.fromJson(i)).toList() : null, 
            status: json['status'], 
        );
    }

    Map toJson() {
        final Map data = new Map ();
        data['status'] = this.status;
        if (this.device_list != null) {
            data['device_list'] = this.device_list!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}