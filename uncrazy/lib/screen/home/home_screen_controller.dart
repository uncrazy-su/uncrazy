import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:uncrazy/data/user/user.dart';
import 'package:uncrazy/screen/home/home_screen_model.dart';

final homeScreenVMProvider =
    StateNotifierProvider<HomeScreenController, HomeScreenModel>(
        (ref) => HomeScreenController());

class HomeScreenController extends StateNotifier<HomeScreenModel> {
  HomeScreenController() : super(const HomeScreenModel());

  Future<void> getProfile() async {
    try {
      final response =
          await client.get(Uri.parse(userURL), headers: await requestHeaders()).whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          print(response.body);
          User user = User.fromJson(jsonDecode(response.body));
          state = state.copyWith(user: user);
          break;
        default:
          handleError(response.statusCode);
          break;
      }
    } catch (e) {
      handleUncaughtError();
    }
  }
}
