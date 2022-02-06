import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'ECG Monitoring',
        ),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EcgPlot()));
            },
            child: Text(
              'Start',
            ),
          ),
        ),
      ),
    );
  }
}
