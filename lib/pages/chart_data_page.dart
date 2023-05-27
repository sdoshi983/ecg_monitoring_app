import 'package:ecg_monitor/helpers/constant.dart';
import 'package:ecg_monitor/pages/chart_data_details_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChartDataPage extends StatefulWidget {
  @override
  State<ChartDataPage> createState() => _ChartDataPageState();
}

class _ChartDataPageState extends State<ChartDataPage> {
  CollectionReference chartData = FirebaseFirestore.instance.collection('chartData');
  List data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getChartData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: Text(
            'Chart Data',
          ),
        ),
        body: isLoading ?
        const Center(child: CircularProgressIndicator(),) :
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: ListView.builder(
            itemCount: data.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        Future.delayed(Duration(milliseconds: 300), (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ChartDataDetailsPage(data: data[index],)));

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: themeColor.withOpacity(0.3))),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.02,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name:  ',
                                  style: TextStyle(
                                      color: deepPurple,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Expanded(
                                  child: Text(
                                    data[index]['name'],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Divider(
                              color: deepPurple.withOpacity(0.5),
                              height: 1,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Date:  ',
                                      style: TextStyle(
                                        color: deepPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      data[index]['date'],
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Efficiency:  ',
                                      style: TextStyle(
                                        color: deepPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '${data[index]['efficiency']} %',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Divider(
                              color: deepPurple.withOpacity(0.5),
                              height: 1,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Age:  ',
                                      style: TextStyle(
                                        color: deepPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      data[index]['age'],
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Height:  ',
                                      style: TextStyle(
                                        color: deepPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      data[index]['height'] + ' cm',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Weight:  ',
                                      style: TextStyle(
                                        color: deepPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      data[index]['weight'] + ' kg',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void getChartData() async {
    final createdBy = Constants.prefs.getString('emailId');
    print(createdBy);
    print(Constants.prefs.containsKey('emailId'));
    final result = await chartData.get();
    final docs = result.docs;
    for(final doc in docs){
      print(doc['createdBy']);
      if(doc['createdBy'] == createdBy){
        data.add(doc);
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
