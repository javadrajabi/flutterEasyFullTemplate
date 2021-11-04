import 'dart:async';
import 'package:template/data/models/login/verify.dart';
import 'package:template/data/models/member/appointment_list.dart';
import 'package:template/data/models/member/profile.dart';
import 'package:template/data/models/member/reserve_list.dart';
import 'package:template/data/models/member/service_provider_list.dart';
import 'package:template/data/models/member/services_list.dart';
import 'package:template/data/models/member/services_provider.dart';
import 'package:template/data/models/member/zarfiyat_list.dart';
import '../../repository.dart';
import '../httpRequest.dart';
import 'package:flutter/material.dart';
import '../../../data/models/login/Verification.dart';
import '../../../data/models/login/UserData.dart';

class ApiMember {
  ApiMember._();

  static Future<Profile?> getProfile() async {
    String path = '/member/get-profile';
    Map? res = await HttpRequest.post(path: path, body: {},showLoading: true);
    if (res != null) {
      return Profile.fromJson(res['data']);
    }
  }

  // http://lumen.local/member/get-appointment-list?maxdate=1400/06/20&limit=1&order=id&ordertype
  static Future<AppointmentList?> getAppointmentList({Map? filters}) async {
    String path = '/member/get-appointment-list';

    Map? res = await HttpRequest.post(path: path, body: filters ?? {});
    if (res != null) {
      return AppointmentList.fromJson(res);
    }
  }

  static Future<ServicesList?> getServicesList({Map? filters}) async {
    String path = '/member/get-services-list';

    Map? res = await HttpRequest.post(path: path, body: filters ?? {},showLoading: true);
    if (res != null) {
      return ServicesList.fromJson(res['data']);
    }
  }

  static Future<ServicesProviderList?> getServicesProviderList(
      {Map? filters}) async {
    String path = '/member/get-services-provider-list';

    Map? res = await HttpRequest.post(path: path, body: filters ?? {});
    if (res != null) {
      return ServicesProviderList.fromJson(res);
    }
  }

  static Future<ServicesProviderList?> getSpecialServicesProviderList(
      {required List sids}) async {
    String path = '/member/get-special-services-provider-list';

    Map? res =
        await HttpRequest.post(path: path, body: {"sids": sids.toString()});
    if (res != null) {
      return ServicesProviderList.fromJson(res);
    }
  }
  static Future<ZarfiyatList?> getZarfiyatList(
      {required Map body}) async {
    String path = '/member/get-zarfiyat-list';

    Map? res =
        await HttpRequest.post(path: path, body: body,showLoading: true);
    if (res != null) {
      return ZarfiyatList.fromJson(res);
    }
  }
  static Future<ReserveList?> getReserveList(
      {required Map body}) async {
    String path = '/member/get-reserve-list';

    Map? res =
        await HttpRequest.post(path: path, body: body,showLoading: true);
    if (res != null) {
      return ReserveList.fromJson(res);
    }
  }
  static Future<Profile?> updateProfile(
      {required Map body}) async {
    String path = '/member/update-profile';

    Map? res =
        await HttpRequest.post(path: path, body: body,showLoading: true);
    if (res != null) {
      Repository.showRequestMessage('ویرایش با موفقیت انجام شد');
      return Profile.fromJson(res['data']);
    }
  }
  static Future addAppointment(
      {required Map body}) async {
    String path = '/member/add-appointment';

    Map? res =
    await HttpRequest.post(path: path, body: body);
    if (res != null) {
      return res;
    }
  }
  static Future<UserData?> signOut(context) async {
    String path = '/auth.signOut';

    await HttpRequest.get(path: path);

    Navigator.of(context).pushNamed('/login');
  }
}
