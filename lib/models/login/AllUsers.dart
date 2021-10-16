class AllUsers {
    Page? page;
    String? status_code;
    List<User>? users;

    AllUsers({ this.page,  this.status_code,  this.users});

    factory AllUsers.fromJson(Map json) {
        return AllUsers(
            page: json['page'] != null ? Page.fromJson(json['page']) : null,
            status_code: json['status_code'],
            users: json['users'] != null ? (json['users'] as List).map((i) => User.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status_code'] = this.status_code;
        if (this.page != null) {
            data['page'] = this.page!.toJson();
        }
        if (this.users != null) {
            data['users'] = this.users!.map((v) => v.toJson()).toList();
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

    factory Page.fromJson(Map<String, dynamic> json) {
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

class User {
    String? created_at;
    String? firstname;
    String? gender;
    int? id;
    String? lastname;
    String? mobile;
    String? role;
    String? state;

    User({this.created_at, this.firstname, this.gender, this.id, this.lastname, this.mobile, this.role, this.state});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(

            firstname: json['firstname'],
            gender: json['gender'] ,
            id: json['id'],
            lastname: json['lastname'],
            mobile: json['mobile'],
            role: json['role'],
            state: json['state'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['firstname'] = this.firstname;
        data['id'] = this.id;
        data['lastname'] = this.lastname;
        data['mobile'] = this.mobile;
        data['role'] = this.role;
        data['state'] = this.state;
        if (this.gender != null) {
            data['gender'] = this.gender;
        }
        return data;
    }
}