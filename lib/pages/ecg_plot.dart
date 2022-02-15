import 'dart:async';

import 'package:ecg_monitor/helpers/constant.dart';
import 'package:ecg_monitor/pages/after_graph_page.dart';
import 'package:ecg_monitor/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;
import 'package:firebase_database/firebase_database.dart';

import 'dashboard.dart';

class EcgPlot extends StatefulWidget {
  EcgPlot({this.efficiency});
  double efficiency;
  @override
  _EcgPlotState createState() => _EcgPlotState();
}

class _EcgPlotState extends State<EcgPlot> {
  List<LiveData> chartData = [], previousData = [], nextData = [];
  ChartSeriesController _chartSeriesController;
  TooltipBehavior _tooltipBehavior;

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("data");
  DatabaseReference pulseRef = FirebaseDatabase.instance.ref("pulse");
  bool isFirstValueSaved = false;
  double firstValue = 0.0;
  double pulseRate = 0.0;

  @override
  void initState() {
    // chartData = getChartData();
    // Timer.periodic(const Duration(seconds: 1), updateDataSource);
    _tooltipBehavior = TooltipBehavior(enable: true);
    getData();
    getPulse();
    super.initState();
  }

  Future<void> getData() async {
    Stream<DatabaseEvent> stream = ref.onValue;
    // stream.
    stream.listen((event) {
      int intPulse = event.snapshot.value;
      double pulse = intPulse.toDouble();
      print("shrey " + pulse.toString());
      updateDataSource(pulse);
      // print("size: " + chartData.length.toString());
      if (isFirstValueSaved == false) {
        firstValue = pulse;
        isFirstValueSaved = true;
      } else {
        if (pulse >= firstValue + firstValue * (widget.efficiency / 10)) {
          // double dPulse = pulse;
          print('alert');
        }
      }
    });
  }

  Future<void> getPulse() async {
    Stream<DatabaseEvent> stream = pulseRef.onValue;
    stream.listen((event) {
      int intPulse = event.snapshot.value;
      double pulse = intPulse.toDouble();
      setState(() {
        pulseRate = pulse;
      });
    });
  }

  void onPreviousButtonTapped() {
    var length = previousData.length;
    if (length > 0) {
      var lastElement = previousData.removeAt(length - 1);
      chartData.insert(0, lastElement);
      var chartDataLength = chartData.length;
      lastElement = chartData.removeAt(chartDataLength - 1);
      nextData.insert(0, lastElement);
    }
    _chartSeriesController.updateDataSource(
        addedDataIndex: 0, removedDataIndex: chartData.length - 1);
    // Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var textTheme = Theme.of(context).textTheme;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return WillPopScope(
      onWillPop: () {
        showAlertDialog(context);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SfCartesianChart(
                  // onChartTouchInteractionMove: (args){
                  //   chartData.add(LiveData(time++, (7)));
                  //   chartData.removeAt(0);
                  //   _chartSeriesController.updateDataSource(
                  //       addedDataIndex: chartData.length - 1, removedDataIndex: 0);
                  // },
                  tooltipBehavior: _tooltipBehavior,
                  // legend: Legend(
                  //     offset: Offset(-20, 90),
                  //     isVisible: true,
                  //     title: LegendTitle(
                  //         text: "HR 60 BPM",
                  //         textStyle: TextStyle(fontWeight: FontWeight.bold))),
                  series: <LineSeries<LiveData, double>>[
                    LineSeries<LiveData, double>(
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      dataSource: chartData,
                      color: const Color.fromRGBO(192, 108, 132, 1),
                      xValueMapper: (LiveData sales, _) => sales.time,
                      yValueMapper: (LiveData sales, _) => sales.speed,
                    )
                  ],
                  primaryXAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 2),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      interval: 1,
                      title: AxisTitle(text: 'Time (seconds)')),
                  // primaryYAxis: NumericAxis(
                  //   axisLine: const AxisLine(width: ),
                  //   majorTickLines: const MajorTickLines(size: 0),
                  //   title: AxisTitle(text: 'Beats'),
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'PULSE RATE:   ',
                          style: textTheme.subtitle1,
                        ),
                        Text(
                          pulseRate.toString(),
                          style: textTheme.subtitle1.copyWith(
                              color: deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: width * 0.06,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: deepPurple),
                          onPressed: () {
                            onPreviousButtonTapped();
                          },
                          child: Icon(Icons.skip_previous),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
                            showAlertDialog(context);
                          },
                          child: Icon(Icons.stop_circle),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: deepPurple),
                          onPressed: () {
                            // func();
                            // onPreviousButtonTapped();
                          },
                          child: Icon(Icons.skip_next),
                        ),
                      ],
                    ),
                    Container(
                      width: width * 0.2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double time = 0.0;
  void updateDataSource(double pulse) {
    // print(time);
    if (nextData.length > 0) {
      var data = nextData.removeAt(0);
      chartData.add(data);
    } else {
      // chartData.add(LiveData((time++), (math.Random().nextInt(60) + 30).toDouble()));
      chartData.add(LiveData((time += 1.0), pulse));
    }
    if (chartData.length >= 35) {
      LiveData data = chartData.removeAt(0);
      previousData.add(data);
      var length = previousData.length;
      if (length == 20) {
        ; //previousData.removeAt(0);
      }
      _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1, removedDataIndex: 0);
    } else {
      _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1);
    }
  }

  void showAlertDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(
          pulseRate: pulseRate,
          time: time,
        );
      },
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  MyAlertDialog({this.pulseRate, this.time});
  double pulseRate;
  double time;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Last Pulse rate: ' + pulseRate.toString()),
          Text('Last time: ' + time.toString()),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: deepPurple),
          onPressed: () {
            // SystemChrome.setPreferredOrientations([
            //   DeviceOrientation.portraitUp,
            //   DeviceOrientation.portraitDown,
            // ]);
            // Navigator.of(context).pop();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AfterGraphPage()), (route) => false);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }

class LiveData {
  LiveData(this.time, this.speed);
  double time;
  double speed;
}

// List<LiveData> getChartData() {
//   return <LiveData>[
//     LiveData(0, 42),
//     LiveData(1, 47),
//     LiveData(2, 43),
//     LiveData(3, 49),
//     LiveData(4, 54),
//     LiveData(5, 41),
//     LiveData(6, 58),
//     LiveData(7, 51),
//     LiveData(8, 98),
//     LiveData(9, 41),
//     LiveData(10, 53),
//     LiveData(11, 72),
//     LiveData(12, 86),
//     LiveData(13, 52),
//     LiveData(14, 94),
//     LiveData(15, 92),
//     LiveData(16, 86),
//     LiveData(17, 72),
//     LiveData(18, 94)
//   ];
// }
