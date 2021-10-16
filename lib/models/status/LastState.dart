import 'LastAssign.dart';
class LastState {
    LastAssign? last_assign;
    String? status;
    int? notification_count;

    LastState({this.last_assign, this.status,this.notification_count});

    factory LastState.fromJson(Map json) {
        print(json['L----------------------astState.fromJson']);
        print(json['Last_assign']);
        return LastState(
            last_assign: json['Last_assign'] != null ? LastAssign.fromJson(json['Last_assign']) : null,
            status: json['status'],
            notification_count: json['notification_count'],
        );
    }

    Map toJson() {
        final Map data = new Map();
        data['status'] = this.status;
        data['notification_count'] = this.notification_count;
        if (this.last_assign != null) {
            data['last_assign'] = this.last_assign!.toJson();
        }
        return data;
    }
}