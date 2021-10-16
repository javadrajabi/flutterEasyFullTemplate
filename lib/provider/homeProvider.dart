import 'dart:async';
import 'dart:convert';

import 'package:template/data/sharedpref/shared_preference_helper.dart';
import 'package:template/models/status/DeviceList.dart';
import 'package:template/models/status/Imei.dart';
import 'package:template/models/status/LastAssign.dart';
import 'package:template/models/status/LastState.dart';
import 'package:template/data/webService/requests/status-api.dart';
import 'package:flutter/material.dart';

class HomeP with ChangeNotifier {
  bool shield = false, carStatus = false;
  String address = 'نامشخص';
  int notificationCount = 0;
  DeviceList? devices = DeviceList();
  LastAssign? lastState =
      LastAssign(imei: '114141414141', spd: 0, suc: '0', cs: '0', dbs: 50);
  Imei? selectedImei = Imei();
  Map weather = {
    'main': {'temp': 273, 'humidity': 50},
    'name': 'no loc',
    'weather': [
      {'icon': "04d"}
    ]
  };
  bool timerIsRun = false;

  init() async {
    timer();
    getDevicelist();
    if (await SharedPreferenceHelper.isDefaultIMEI()) {
      getLastStatus();
    }
  }

  timer() {
    // LocalShP.deleteSelectedIMEI();
    if (timerIsRun == false) {
      timerIsRun = true;
      const oneSec = const Duration(seconds: 10);
      Timer.periodic(oneSec, (Timer t) async {
        if (await SharedPreferenceHelper.isDefaultIMEI()) {
          getLastStatus();
        } else {
          getDevicelist();
        }
      });
    }
  }

  setDefaultImei(Imei dev) async {
    selectedImei = Imei.fromJson(dev.toJson());
    await SharedPreferenceHelper.setDefaultIMEI(dev.toJson());
    pcounter = 0;
    counter = 0;
    getLastStatus();
  }

  getDevicelist() async {
    devices = await ApiStatus.deviceList();
    if (!(await SharedPreferenceHelper.isDefaultIMEI())) {
      selectedImei = Imei.fromJson(devices!.device_list![0].imei!.toJson());
      await SharedPreferenceHelper.setDefaultIMEI(devices!.device_list![0].imei!.toJson());
    }
    if (devices != null) {
      devices!.device_list!.forEach((element) {
        print(element.id.toString() +
            '@@@@@' +
            (selectedImei?.id.toString() ?? 'no'));
        if (element.imei!.id == selectedImei!.id) {

            setDefaultImei(Imei.fromJson(element.imei!.toJson()));

        }
      });
    }

    getLastStatus();
    notifyListeners();
  }

  getLastStatus() async {
    var r = await SharedPreferenceHelper.getDefaultIMEI();
    print('-------------getLastStatus');

    selectedImei = Imei.fromJson(r);
    LastState lastSate = await ApiStatus.lastAssign(imei: selectedImei!.imei);
    print(lastSate.last_assign!.toJson());
    notificationCount = lastSate.notification_count!;
    lastState = lastSate.last_assign!;
    getaddress();
    showWeather();
    print('-------------********');
    print(lastSate.toJson());
    notifyListeners();
  }

  int pcounter = 0;

  getaddress() {
    if (pcounter == 0) if (lastState != null)
      ApiStatus.positionToAddress(lat: lastState!.lat, lng: lastState!.lon)
          .then((value) {
        // print('value22222222222222222222222222222222'+value);
        address = value;
        notifyListeners();
      });

    pcounter++;
    if (pcounter == 2) {
      pcounter = 0;
    }
  }

  int counter = 0;

  showWeather() async {
    if (counter == 0)
      ApiStatus.getWeather(lat: lastState!.lat, lng: lastState!.lon)
          .then((value) {
        print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww' + value.toString());
        weather = value;
        notifyListeners();
      });
    counter++;
    if (counter == 100) {
      counter = 0;
    }
  }

  deviceRename(int index, String name) {
    devices!.device_list![index].imei!.name = name;

    getDevicelist();
    notifyListeners();
  }

}
