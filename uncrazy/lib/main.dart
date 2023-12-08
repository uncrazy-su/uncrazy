import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/login/login_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      theme: ThemeData(
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: Loading(),
    );
  }
}

class Loading extends StatelessWidget {
  final refresher = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: refresher,
        child: Container(
          color: Color(0xFF2B2B2B),
          child: const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          )),
        ),
        onRefresh: () async {
          refresher.headerMode?.value = RefreshStatus.idle;
          SharedPreferences pref = await SharedPreferences.getInstance();
          if (pref.getString('token') != null) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: ((context) => HomeScreen())),
                (route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: ((context) => WelcomeScreen())),
                (route) => false);
          }
        });
  }
}
