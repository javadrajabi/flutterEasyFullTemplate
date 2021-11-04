class Verification {
  String? hash;
  String? status_code;
  String? status_message;

  Verification({this.hash, this.status_code, this.status_message});

  factory Verification.fromJson(Map json) {
    return Verification(
      hash: json['hash'],
      // status_code: json['status_code'],
      // status_message: json['status_message'],
    );
  }

  Map toJson() {
    final Map data = new Map();
    data['hash'] = this.hash;
    // data['status_code'] = this.status_code;
    // data['status_message'] = this.status_message;
    return data;
  }
}