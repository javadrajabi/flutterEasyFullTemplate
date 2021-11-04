import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:template/data/webService/requests/member.dart';
import 'package:template/data/models/member/appointment_list.dart';
import 'package:template/data/models/member/profile.dart';
import 'package:template/data/models/member/reserve_list.dart';
import 'package:template/data/models/member/service_provider_list.dart';
import 'package:template/data/models/member/services_list.dart';
import 'package:template/data/models/member/services_provider.dart';
import 'package:template/data/models/member/zarfiyat_list.dart';

class HomeP with ChangeNotifier {
  Profile? profile;
  List<Appointment>? appointments;
  ServicesList? services;
  ServicesProviderList? servicesProviders;
  List<ServicesProvider>? specialServicesProviders;
  List<ServicesProvider>? filterdedServices;
  List<Zarfiyat>? zarfiyatList;
  List<Reserve>? reserveList;

  getProfile() {
    print('getProfile');
    ApiMember.getProfile().then((value) {
      profile = value;
      notifyListeners();
    });
  }

  getAppointments(Map<String, dynamic> map) {
    map['mindate']=Jalali.now().formatCompactDate();
    map['order']='reserve_date';
    map['limit']='10';

    ApiMember.getAppointmentList(filters: map).then((value) {
      print('getAppointments');
      appointments = value?.data??[];

      // log(value?.toJson().toString()??'');
      notifyListeners();
    });
  }

  getServices(Map<String, dynamic> map) {
    print('getServices');
    ApiMember.getServicesList(filters: map).then((value) {
      services = value;
      notifyListeners();
    });
  }

  getServicesProvider(Map<String, dynamic> map) {
    print('getServicesProvider');
    ApiMember.getServicesProviderList(filters: map).then((value) {
      servicesProviders = value;
      filterdedServices = value?.data ?? [];
      // log(value?.toJson().toString()??'');
      notifyListeners();
    });
  }

  filterServiceByString(String name) {
    print('filterServiceByString: ' + name);
    filterdedServices = servicesProviders!.data!.where((i) {
      if (i.name != null) {
        if (i.name!.contains(name)) {
          return true;
        }
        return false;
      }
      return false;
    }).toList();
    notifyListeners();
  }

  getSpecialServicesProvider(List sids) {
    ApiMember.getSpecialServicesProviderList(sids: sids).then((value) {
      specialServicesProviders = value?.data ?? [];
      // log(value?.toJson().toString()??'');
      notifyListeners();
    });
  }

  getZarfiyatList(
      {String? date, required List serviceIds, required String spId}) {
    zarfiyatList = [];
    Map body = {
      "service-ids": serviceIds.toString(),
      "sp_id": spId,
    };
    if (date != null) {
      body['date'] = date;
    }
    ApiMember.getZarfiyatList(body: body).then((value) {
      zarfiyatList = value?.data ?? [];
      // log(value?.toJson().toString()??'');
      notifyListeners();
    });
  }

  getReserveList(
      {String? date, required List serviceIds, required String spId}) {
    Map body = {
      "service-ids": serviceIds.toString(),
      "sp_id": spId,
      "date": date
    };
    ApiMember.getReserveList(body: body).then((value) {
      reserveList = value?.data ?? [];
      // log(value?.toJson().toString()??'');
      notifyListeners();
    });
  }

  updateProfile({required String fname, required String lname}) {
    print('getProfile');
    ApiMember.updateProfile(body: {"fname": fname, "lname": lname})
        .then((value) {
      profile = value;
      notifyListeners();
    });
  }
  Future <String> addAppointment({required int reserve_id, required List selected_service_id}) async{
    print('addAppointment');
  final res=  await ApiMember.addAppointment(body: {"reserve_id": reserve_id.toString(), "selected_service_id": selected_service_id.toString()});
        return "نوبت برا شما ثبت شد";
  }
}
