import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard.dart';

class AfterGraphPage extends StatefulWidget {
  AfterGraphPage({this.pop = false});
  bool pop;

  @override
  State<AfterGraphPage> createState() => _AfterGraphPageState();
}

class _AfterGraphPageState extends State<AfterGraphPage> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    //set time to load the new page
    Future.delayed(Duration(milliseconds: 500), () {
      if(widget.pop){
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    return Container(
      color: Colors.white,
    );
  }
}
