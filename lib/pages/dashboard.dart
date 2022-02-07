import 'package:ecg_monitor/helpers/constant.dart';
import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int dropDownValue = 10;
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          'ECG Monitoring',
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: deepPurple),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EcgPlot()));
                },
                child: Text(
                  'Start',

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select accuracy: ', style: textTheme.subtitle1,),
                  AccuracyDropDown()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccuracyDropDown extends StatefulWidget {
  @override
  _AccuracyDropDownState createState() => _AccuracyDropDownState();
}

class _AccuracyDropDownState extends State<AccuracyDropDown> {
  List<int> accuracies = [10, 20, 30, 40, 50, 60, 70, 80, 90];
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return DropdownButton(
        value: dropDownValue,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        elevation: 16,
        style: textTheme.subtitle1.copyWith(color: Colors.deepPurple, fontWeight: FontWeight.bold,),
        onChanged: (newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: accuracies.map<DropdownMenuItem<int>>(
          (accuracy) {
            return DropdownMenuItem<int>(
              value: accuracy,
              child: Text(accuracy.toString()),
            );
          },
        ).toList());
  }
}
