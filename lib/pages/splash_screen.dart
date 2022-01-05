import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 4), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Main()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
