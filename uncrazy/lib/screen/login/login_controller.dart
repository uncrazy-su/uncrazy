// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart';
// import 'package:uncrazy/data/api_response.dart';
// import 'package:uncrazy/data/constant.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uncrazy/data/user/user.dart';

// Future<bool> login(String emailPhone, String password) async {
//   if (emailPhone.startsWith('0')) {
//     try {
//       final response = await http.post(Uri.parse(loginURL),
//           headers: await requestHeaders(),
//           body: json.encode({'phone_no': emailPhone, 'password': password}));
//       switch (response.statusCode) {
//         case 200:
//           User user = User.fromJson(jsonDecode(response.body));
//           SharedPreferences pref = await SharedPreferences.getInstance();
//           pref.setString('token', user.token ?? '');
//           return true;
//       }
//       print(response.body);
//       return false;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   } else {
//     try {
//       final response = await http.post(Uri.parse(loginURL),
//           headers: await requestHeaders(),
//           body: json.encode({'email': emailPhone, 'password': password}));
//       switch (response.statusCode) {
//         case 200:
//           User user = User.fromJson(jsonDecode(response.body));
//           SharedPreferences pref = await SharedPreferences.getInstance();
//           pref.setString('token', user.token ?? '');
//           return true;
//       }
//       print(response.body);
//       return false;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
