class Tasks {
    Page? page;
    String? status_code;
    List<Task>? tasks;

    Tasks({this.page, this.status_code, this.tasks});

    factory Tasks.fromJson(Map json) {
        return Tasks(
            page: json['page'] != null ? Page.fromJson(json['page']): null,
            status_code: json['status_code'],
            tasks: json['tasks'] != null ? (json['tasks'] as List).map((i) => Task.fromJson(i)).toList() : null,
        );
    }

    Map? toJson() {
        final Map data = new Map();
        data['status_code'] = this.status_code;
        if (this.page != null) {
            data['page'] = this.page!.toJson();
        }
        if (this.tasks != null) {
            data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
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

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['current'] = this.current;
        data['last'] = this.last;
        data['limit'] = this.limit;
        data['total'] = this.total;
        return data;
    }
}

class Task {
    Object? comment;
    String? created_at;
    String? created_by;
    String? do_at;
    String? do_minutes;
    Object? done_at;
    Object? done_minutes;
    int? id;
    String? name;
    String? project_id;
    String? state;
    String? user_id;

    Task({this.comment, this.created_at, this.created_by, this.do_at, this.do_minutes, this.done_at, this.done_minutes, this.id, this.name, this.project_id, this.state, this.user_id});

    factory Task.fromJson(Map<String, dynamic> json) {
        return Task(
            comment: json['comment'] != null ? json['comment']: null,
            created_at: json['created_at'],
            created_by: json['created_by'],
            do_at: json['do_at'],
            do_minutes: json['do_minutes'],
            done_at: json['done_at'] != null ? json['done_at'] : null,
            done_minutes: json['done_minutes'] != null ? json['done_minutes'] : null,
            id: json['id'],
            name: json['name'],
            project_id: json['project_id'],
            state: json['state'],
            user_id: json['user_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['created_by'] = this.created_by;
        data['do_at'] = this.do_at;
        data['do_minutes'] = this.do_minutes;
        data['id'] = this.id;
        data['name'] = this.name;
        data['project_id'] = this.project_id;
        data['state'] = this.state;
        data['user_id'] = this.user_id;
        if (this.comment != null) {
            data['comment'] = this.comment;
        }
        if (this.done_at != null) {
            data['done_at'] = this.done_at;
        }
        if (this.done_minutes != null) {
            data['done_minutes'] = this.done_minutes;
        }
        return data;
    }
}