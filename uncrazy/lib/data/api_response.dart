import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> requestHeaders() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token') ?? '';
  return {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}

