// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uncrazy/data/api_response.dart';
// import 'package:uncrazy/data/constant.dart';
// import 'package:http/http.dart' as http;
// import 'package:uncrazy/data/user/user.dart';

// Future<bool> register(String name, String emailPhone, String password) async {
//   String email;
//   String phone;

//   if (emailPhone.startsWith('0')) {
//     phone = emailPhone;
//     try {
//       final response = await http.post(Uri.parse(signupURL),
//           headers: await requestHeaders(),
//           body: json
//               .encode({'name': name, 'phone_no': phone, 'password': password}));
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
//       return false;
//     }
//   } else {
//     email = emailPhone;
//     try {
//       final response = await http.post(Uri.parse(signupURL),
//           headers: await requestHeaders(),
//           body: json
//               .encode({'name': name, 'email': email, 'password': password}));
//       switch (response.statusCode) {
//         case 200:
//           User user = User.fromJson(jsonDecode(response.body));
//           SharedPreferences pref = await SharedPreferences.getInstance();
//           pref.setString('token', user.token ?? '');
//           return true;
//       }
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }
// }
