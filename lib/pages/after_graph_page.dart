import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard.dart';

class AfterGraphPage extends StatefulWidget {

  @override
  State<AfterGraphPage> createState() => _AfterGraphPageState();
}

class _AfterGraphPageState extends State<AfterGraphPage> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Container(
      color: Colors.white,
    );
  }
}
