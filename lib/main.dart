import 'package:ecg_monitor/helpers/constant.dart';
import 'package:ecg_monitor/pages/dashboard.dart';
import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:ecg_monitor/pages/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

// AndroidNotificationChannel channel;
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (!kIsWeb) {
  //   channel = const AndroidNotificationChannel(
  //     'high_importance_channel', // id
  //     'High Importance Notifications', // title
  //     //'This channel is used for important notifications.', // description
  //     importance: Importance.high,
  //   );
  //
  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
    await Firebase.initializeApp();
    runApp(MyApp());
  // }
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    onStartup();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ?
    Center(child: CircularProgressIndicator(),) :
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }

  void onStartup() async {
    Constants.prefs = await SharedPreferences.getInstance();
    setState((){
      isLoading = false;
    });
  }
}
