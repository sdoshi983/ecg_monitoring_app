import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BeforeGraphPage extends StatefulWidget {
  BeforeGraphPage({
    this.fromChartDetailsPage = false,
    this.fetchDataFromDB,
    this.chartDataFromDB,
  });

  bool fromChartDetailsPage;
  bool fetchDataFromDB;
  List chartDataFromDB;

  @override
  State<BeforeGraphPage> createState() => _BeforeGraphPageState();
}

class _BeforeGraphPageState extends State<BeforeGraphPage> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(milliseconds: 200), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => widget.fromChartDetailsPage
                  ? EcgPlot(
                fetchDataFromDB: widget.fetchDataFromDB,
                chartDataFromDB: widget.chartDataFromDB,
              )
                  : EcgPlot()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   // DeviceOrientation.landscapeRight,
    // ]);
    return Container();
  }
}
