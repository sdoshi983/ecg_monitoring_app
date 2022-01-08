import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:flutter/material.dart';
import 'package:ecg_monitor/helpers/constant.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    // Future.delayed(Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => EcgPlot()));
    // });
    super.initState();
  }

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
