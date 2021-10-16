class Projects {
  Page? page;
  List<Project>? projects;
  String? status_code;

  Projects({this.page, this.projects, this.status_code});

  factory Projects.fromJson(Map json) {
    return Projects(
      page: json['page'] != null ? Page.fromJson(json['page']) : null,
      projects: json['projects'] != null
          ? (json['projects'] as List).map((i) => Project.fromJson(i)).toList()
          : null,
      status_code: json['status_code'],
    );
  }

  Map toJson() {
    final Map data = new Map();
    data['status_code'] = this.status_code;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Page {
  int? current;
  int? last;
  int? limit;
  int? total;

  Page({this.current, this.last, this.limit, this.total});

  factory Page.fromJson(Map json) {
    return Page(
      current: json['current'],
      last: json['last'],
      limit: json['limit'],
      total: json['total'],
    );
  }

  Map toJson() {
    final Map data = new Map();
    data['current'] = this.current;
    data['last'] = this.last;
    data['limit'] = this.limit;
    data['total'] = this.total;
    return data;
  }
}

class Project {
  String? comment;
  String? created_at;
  String? created_by;
  int? id;
  String? name;
  String? state;

  Project(
      {this.comment,
      this.created_at,
      this.created_by,
      this.id,
      this.name,
      this.state});

  factory Project.fromJson(Map json) {
    return Project(
      comment: json['comment'],
      created_at: json['created_at'],
      created_by: json['created_by'],
      id: json['id'],
      name: json['name'],
      state: json['state'],
    );
  }

  Map toJson() {
    final Map data = new Map();
    data['created_at'] = this.created_at;
    data['created_by'] = this.created_by;
    data['id'] = this.id;
    data['name'] = this.name;
    data['state'] = this.state;
    if (this.comment != null) {
      data['comment'] = this.comment;
    }
    return data;
  }
}
