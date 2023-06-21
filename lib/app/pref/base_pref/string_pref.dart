

import 'package:ici_menu/app/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Pref<T> {
  String get prefKey;
  SharedPreferences get prefs => getIt<SharedPreferences>();

  Future<bool> setValue(T value);
  T? getValue();
  Future<bool> removeValue(){
    return  prefs.remove(prefKey);
  }
}

abstract class StringPref extends Pref<String> {
  @override
  Future<bool> setValue(String value) async {
    return await prefs.setString(prefKey, value);
  }

  @override
  String? getValue() {
    return prefs.getString(prefKey);
  }

}