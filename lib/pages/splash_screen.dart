import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:ecg_monitor/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ecg_monitor/helpers/constant.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter_platform_alert/flutter_platform_alert.dart';
// import 'package:flutter_restart/flutter_restart.dart';

import 'dashboard.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref("pulse");

  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 3), () {
      bool isLoggedIn = Constants.prefs.getBool('isLoggedIn');
      if(isLoggedIn == true){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }

    });
    super.initState();
    // func();
  }

  Future<void> func() async {
    // var result = await FlutterRestart.restartApp();
  }
  // Future<void> func() async{
  //   Stream<DatabaseEvent> stream = ref.onValue;
  //   stream.listen((event) {
  //     var object = event.snapshot.value;
  //     print(object.runtimeType);
  //   });
  // }

  // Future<void> func() async {
  //   await FlutterPlatformAlert.playAlertSound();
  //   await FlutterPlatformAlert.showAlert(
  //     windowTitle: 'This ia title',
  //     text: 'This is body',
  //     alertStyle: AlertButtonStyle.yesNoCancel,
  //     iconStyle: IconStyle.information,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3000),
                    ),
                    child: Lottie.asset('assets/heart.json'))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
