/// data : [{"id":27,"sp_id":2,"service_id":"4","shift":2,"set_date":"1400/06/31 09:27:29","date":"1400/06/31","zarfiyat":2,"reserved":0,"wait_time":"60","starttime":"08:00","endtime":"10:00","status":1}]

class ZarfiyatList {
  ZarfiyatList({
      this.data,});

  ZarfiyatList.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Zarfiyat.fromJson(v));
      });
    }
  }
  List<Zarfiyat>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 27
/// sp_id : 2
/// service_id : "4"
/// shift : 2
/// set_date : "1400/06/31 09:27:29"
/// date : "1400/06/31"
/// zarfiyat : 2
/// reserved : 0
/// wait_time : "60"
/// starttime : "08:00"
/// endtime : "10:00"
/// status : 1

class Zarfiyat {
  Zarfiyat({
      this.id, 
      this.spId, 
      this.serviceId, 
      this.shift, 
      this.setDate, 
      this.date, 
      this.zarfiyat, 
      this.reserved, 
      this.waitTime, 
      this.starttime, 
      this.endtime, 
      this.status,});

  Zarfiyat.fromJson(dynamic json) {
    id = json['id'];
    spId = json['sp_id'];
    serviceId = json['service_id'];
    shift = json['shift'];
    setDate = json['set_date'];
    date = json['date'];
    zarfiyat = json['zarfiyat'];
    reserved = json['reserved'];
    waitTime = json['wait_time'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    status = json['status'];
  }
  int? id;
  int? spId;
  String? serviceId;
  int? shift;
  String? setDate;
  String? date;
  int? zarfiyat;
  int? reserved;
  String? waitTime;
  String? starttime;
  String? endtime;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sp_id'] = spId;
    map['service_id'] = serviceId;
    map['shift'] = shift;
    map['set_date'] = setDate;
    map['date'] = date;
    map['zarfiyat'] = zarfiyat;
    map['reserved'] = reserved;
    map['wait_time'] = waitTime;
    map['starttime'] = starttime;
    map['endtime'] = endtime;
    map['status'] = status;
    return map;
  }

}