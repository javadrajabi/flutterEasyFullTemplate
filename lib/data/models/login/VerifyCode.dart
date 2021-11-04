class VerifyCode {
    String? access_token;
    int? expires_in;
    String? hash;
    String? status_code;
    String? token_type;
    String? status_message;
    User? user;

    VerifyCode({this.access_token, this.expires_in, this.hash,this.status_message, this.status_code, this.token_type, this.user});

    factory VerifyCode.fromJson(Map json) {
        return VerifyCode(
            access_token: json['access_token'],
            expires_in: json['expires_in'],
            hash: json['hash'],
            status_code: json['status_code'],
            status_message: json['status_message'],
            token_type: json['token_type'],
            user: json['user'] != null ? User.fromJson(json['user']) : null,
        );
    }

    Map? toJson() {
        final Map data = new Map();
        data['access_token'] = this.access_token;
        data['expires_in'] = this.expires_in;
        data['hash'] = this.hash;
        data['status_code'] = this.status_code;
        data['status_message']= this.status_message;
        data['token_type'] = this.token_type;
        if (this.user != null) {
            data['user'] = this.user!.toJson();
        }
        return data;
    }
}

class User {
    int? created_at;
    String? firstname;
    String? gender;
    int? id;
    String? lastname;
    String? mobile;
    String? role;
    String? state;

    User({this.created_at, this.firstname, this.gender, this.id, this.lastname, this.mobile, this.role, this.state});

    factory User.fromJson(Map json) {
        return User(
            created_at:json['created_at'],
            firstname: json['firstname'],
            gender: json['gender'],
            id: json['id'],
            lastname: json['lastname'],
            mobile: json['mobile'],
            role: json['role'],
            state: json['state'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map();
        data['created_at'] = this.created_at;
        data['firstname'] = this.firstname;
        data['gender'] = this.gender;
        data['id'] = this.id;
        data['lastname'] = this.lastname;
        data['mobile'] = this.mobile;
        data['role'] = this.role;
        data['state'] = this.state;
        return data;
    }
}