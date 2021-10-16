
class LastAssign {
    String? Do;
    String? acd;
    String? alt;
    String? cbs;
    String? suc;
    String? created_at;
    int? credit;
    String? cs;
    int? dbs;
    int? deg;
    int? id;
    String? imei;
    String? lat;
    String? lon;
    String? mid;
    String? sos;
    int? spd;
    String? updated_at;

    LastAssign({this.Do, this.acd, this.alt, this.cbs,this.suc, this.created_at, this.credit, this.cs, this.dbs, this.deg, this.id, this.imei, this.lat, this.lon, this.mid, this.sos, this.spd, this.updated_at});

    factory LastAssign.fromJson(Map<String, dynamic> json) {
        return LastAssign(
            Do: json['do'],
            acd: json['acd'], 
            alt: json['alt'],
            cbs: json['cbs'],
            suc: json['suc'],
            created_at: json['created_at'], 
            credit: json['credit'], 
            cs: json['cs'], 
            dbs: json['dbs'], 
            deg: json['deg'], 
            id: json['id'], 
            imei: json['imei'], 
            lat: json['lat'], 
            lon: json['lon'], 
            mid: json['mid'], 
            sos: json['sos'], 
            spd: json['spd'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['do'] = this.Do;
        data['acd'] = this.acd;
        data['alt'] = this.alt;
        data['cbs'] = this.cbs;
        data['suc'] = this.suc;
        data['created_at'] = this.created_at;
        data['credit'] = this.credit;
        data['cs'] = this.cs;
        data['dbs'] = this.dbs;
        data['deg'] = this.deg;
        data['id'] = this.id;
        data['imei'] = this.imei;
        data['lat'] = this.lat;
        data['lon'] = this.lon;
        data['mid'] = this.mid;
        data['sos'] = this.sos;
        data['spd'] = this.spd;
        data['updated_at'] = this.updated_at;
        return data;
    }
}