/// name : "javad"
/// id : 12
/// type : 1

class NecessaryChat {
  NecessaryChat({this.name, this.id, this.type, this.parentId, this.mobile});

  NecessaryChat.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    parentId = json['parent_id'];
    mobile = json['mobile'];
  }

  String? name;
  String? id;
  String? type;
  String? parentId;
  String? mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['type'] = type;
    map['parent_id'] = parentId;
    map['mobile'] = mobile;
    return map;
  }
}
