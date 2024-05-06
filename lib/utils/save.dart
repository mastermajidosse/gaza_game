import 'package:shared_preferences/shared_preferences.dart';

class Save {
  static const String app_name = '';
  static const String app_version = 'version 1.0.0';
  static const String lang = '';

  static const int app_v_code = 1;

  static late SharedPreferences prefs;

  static List<String> freinds = [];

  static int life = 3;

  static List<String> level = ["0"];

  static int point = 0;

  static int? getLife() {
    return prefs.getInt("life");
  }

  Future<bool> SetLife({int xlife = 10}) async {
    return prefs.setInt("life", xlife);
  }

  static int? getpoint() {
    return prefs.getInt("point") ?? 0;
  }

  Future<bool> Setpoint({int xpoint = 3}) async {
    return prefs.setInt("point", xpoint);
  }

  static List<String> getlevel() {
    if (prefs.getStringList("level") == null) ["0"];

    return prefs.getStringList("level") ?? [];
  }

  String zero = "0";
  Future<bool> Setlevel({List<String>? xlevel}) async {
    return prefs.setStringList("level", xlevel ?? level);
  }

  static List<String> getthislevel() {
    return prefs.getStringList("thislevel") ?? [];
  }

  // Future<bool> Setthislevel({List<String>? xthislevel}) async {
  //   return prefs.setStringList("thislevel", xthislevel ?? 0);
  // }

  static int? getday() {
    return prefs.getInt("daytime");
  }

  Future<bool> Setdaytime(int day) async {
    return prefs.setInt("daytime", day);
  }

  static int? getmonth() {
    return prefs.getInt("monthtime");
  }

  Future<bool> Setmonthtime(int month) async {
    return prefs.setInt("monthtime", month);
  }

  static int? getyear() {
    return prefs.getInt("yeartime");
  }

  Future<bool> Setyeartime(int year) async {
    return prefs.setInt("yeartime", year);
  }
}
