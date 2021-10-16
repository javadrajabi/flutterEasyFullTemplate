import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/models/login/UserData.dart';
import 'package:template/models/login/VerifyCode.dart';
import 'package:template/data/webService/httpRequest.dart';
import 'package:template/provider/baseVar.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences? _sharedPreference;

  factory SharedPreferenceHelper() => SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal();

  static const String keyUsername = "key_username";

  static Future<void> init() async => _sharedPreference ??= await SharedPreferences.getInstance();

  String get username => _sharedPreference!.getString(keyUsername) ?? "";

  set username(String value) {
    _sharedPreference!.setString(keyUsername, value);
  }

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference!.getString(Preferences.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference!.setString(Preferences.auth_token, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference!.remove(Preferences.auth_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference!.getBool(Preferences.is_logged_in) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference!.setBool(Preferences.is_logged_in, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference!.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference!.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference!.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference!.setString(Preferences.current_language, language);
  }



// constants/strings.dart


  static String? getString(String name) {

    return _sharedPreference!.getString(name);
  }

  static Future<bool> setString(String name, String value) async {
    // // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setString(name, value);
  }

  static Future<int?> getIntiger(String name) async {
    // // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.getInt(name);
  }

  static Future<bool> setIntiger(String name, int value) async {
    // // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setInt(name, value);
  }

  static Future<String?> getDouble(String name) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.getString(name);
  }

  static Future<bool> setDouble(String name, double value) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setDouble(name, value);
  }

  static Future<List?> getListString(String name) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.getStringList(name);
  }

  static Future<bool> setListString(String name, List<String> value) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setStringList(name, value);
  }

  static Future<bool> clear() async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.clear();
  }

  static Future<bool> remove(key) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.remove(key);
  }

  static Future<bool> containsKey(key) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.containsKey(key);
  }

  static Future<Set<String>> getKeys(key) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.getKeys();
  }

  static Future<void> reload(key) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.reload();
  }

  static Future setUserDatas(key, value) async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setString(key, jsonEncode(value));
  }

  static Future<UserData> getUserDatas(key) async {
    // final myStorage = await SharedPreferences.getInstance();
    return UserData.fromJson(jsonDecode(_sharedPreference!.getString(key).toString()));
  }

  ///////////////////////////////

  static Future setUserData(VerifyCode? value) async {

    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setString("userData", jsonEncode(value!.toJson()));
  }

  static Future<VerifyCode?> getUserData(value) async {
    // final myStorage = await SharedPreferences.getInstance();
    return VerifyCode.fromJson(
        jsonDecode(_sharedPreference!.getString('userData').toString()));
  }


  static Future<bool> isSetToken() async {
    if ( _sharedPreference!.containsKey('userData')) {
      print('1111111111111111111111111');
      var res = await SharedPreferenceHelper.getUserData('userData');
      HttpRequest.token = res!.access_token!;
      BaseVar.userData = res;
      return true;
      // UserData.fromJson(res);
    } else {
      print('2222222222222222222222222');
      return false;
    }
  }
  static Future <bool> deleteDefaultIMEI()async{
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.remove('selectetdIMEI');
  }
  static Future <Map> getDefaultIMEI()async{
    // final myStorage = await SharedPreferences.getInstance();
    return json.decode(_sharedPreference!.getString('selectetdIMEI')!);
  }
  static Future setDefaultIMEI(Map imei)async{
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setString('selectetdIMEI',json.encode(imei));
  }

  static Future <bool> isDefaultIMEI()async {
    return await containsKey('selectetdIMEI');
  }
  static Future setPassword(String pass)async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.setString('password',pass);
  }
  static Future getPassword()async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.getString('password');
  }
  static Future <bool> isPasswordSet()async {
    return await containsKey('password');
  }
  static Future<bool> removePassword() async {
    // final myStorage = await SharedPreferences.getInstance();
    return _sharedPreference!.remove('password');
  }
}
