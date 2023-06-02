import 'package:ecg_monitor/helpers/constant.dart';
import 'package:ecg_monitor/pages/chart_data_page.dart';
import 'package:ecg_monitor/pages/ecg_plot.dart';
import 'package:ecg_monitor/pages/login_page.dart';
import 'package:ecg_monitor/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

double dropDownValue = 20.0;
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference chartData = FirebaseFirestore.instance.collection('chartData');
  TextEditingController name = TextEditingController(text: '');
  TextEditingController age = TextEditingController(text: '');
  TextEditingController heightController = TextEditingController(text: '');
  TextEditingController weight = TextEditingController(text: '');
  TextEditingController medicalHistory = TextEditingController(text: '');
  List<double> accuracies = [20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    // ]);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          'Dashboard',
        ),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ChartDataPage()));
              },
              child: Icon(Icons.remove_red_eye)),
          SizedBox(width: 12,),
          GestureDetector(
              onTap: (){
                Constants.prefs.clear();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SplashScreen()), (route) => false);
              },
              child: Icon(Icons.logout)),
          SizedBox(width: 12,)
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Name',
                      floatingLabelStyle: TextStyle(color: deepPurple),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: deepPurple),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Age',
                      floatingLabelStyle: TextStyle(color: deepPurple),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: deepPurple),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Height (in cm)',
                      floatingLabelStyle: TextStyle(color: deepPurple),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: deepPurple),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Weight (in KG)',
                      floatingLabelStyle: TextStyle(color: deepPurple),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: deepPurple),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: medicalHistory,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Medical History',
                      floatingLabelStyle: TextStyle(color: deepPurple),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: deepPurple),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select efficiency: ', style: textTheme.subtitle1,),
                      // AccuracyDropDown()
                      DropdownButton(
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          elevation: 16,
                          style: textTheme.subtitle1.copyWith(color: Colors.deepPurple, fontWeight: FontWeight.bold,),
                          onChanged: (newValue) {
                            setState(() {
                              dropDownValue = newValue;
                            });
                          },
                          items: accuracies.map<DropdownMenuItem<double>>(
                                (accuracy) {
                              return DropdownMenuItem<double>(
                                value: accuracy,
                                child: Text(accuracy.toString()),
                              );
                            },
                          ).toList())
                    ],
                  ),
                  SizedBox(height: height * 0.1,),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: width,
        height: height * 0.08,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: deepPurple),
          onPressed: onStartButtonClicked,
          child: Text(
            'Start',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1
            ),
          ),
        ),
      ),
    );
  }

  void onStartButtonClicked() async {
    if(_formKey.currentState.validate()){
      final createdBy = Constants.prefs.getString('emailId');

      final result = await chartData.add({
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'name': name.text,
        'age': age.text,
        'height': heightController.text,
        'weight': weight.text,
        'medicalHistory': medicalHistory.text.isEmpty ? 'No history' : medicalHistory.text,
        'efficiency': dropDownValue,
        'createdBy': createdBy,
      });
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EcgPlot(efficiency: dropDownValue, documentId: result.id,)));
    }

  }
}

class AccuracyDropDown extends StatefulWidget {
  @override
  _AccuracyDropDownState createState() => _AccuracyDropDownState();
}

class _AccuracyDropDownState extends State<AccuracyDropDown> {
  List<int> accuracies = [20, 30, 40, 50, 60, 70, 80, 90];
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
