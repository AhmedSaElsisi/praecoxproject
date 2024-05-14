
import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';


class CashHelper {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }
  // key = value
  // name = "abdo"
  // Write   data

  static putString({required MyKeyCache key, required String value}) async {
    await preferences!.setString(key.name, value) ;
  }
// Read data
  static getString({required MyKeyCache key}) {
    return preferences!.getString(key.name)?? '' ;
  }
  static putDouble({required MyKeyCache key, required double value}) async {
    await preferences!.setDouble(key.name, value);
  }
// Read data
  static getDouble({required MyKeyCache key}) {
    return preferences!.getDouble(key.name)?? 0.0;
  }
// int
  static putInt({required MyKeyCache key, required int value}) async {
    await preferences!.setInt(key.name, value);
  }
  static getInt({required MyKeyCache key}) {
    return preferences!.getInt(key.name)?? 0;
  }
  // bool
  static putBoolean({required MyKeyCache key, required bool value}) async {
    await preferences!.setBool(key.name, value);
  }
  static getBoolean({required MyKeyCache key}) {
    return preferences!.getBool(key.name) ?? false;
  }
  removeFromShared({required MyKeyCache key})async{
    await preferences!.remove(key.name);
  }

  clearShared()async{
    await preferences!.clear();
  }

}