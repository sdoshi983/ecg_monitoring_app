import 'package:ecg_monitor/helpers/constant.dart';
import 'package:flutter/material.dart';

class ChartDataDetailsPage extends StatefulWidget {
  ChartDataDetailsPage({this.data});

  var data;

  @override
  State<ChartDataDetailsPage> createState() => _ChartDataDetailsPageState();
}

class _ChartDataDetailsPageState extends State<ChartDataDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: Text(
            'Chart Data Details',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                Future.delayed(Duration(milliseconds: 300), () {});
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: themeColor.withOpacity(0.3))),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  // vertical: height * 0.02,
                ).copyWith(top: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.data['name'],
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
                              widget.data['date'],
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
                              '${widget.data['efficiency']} %',
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
                              widget.data['age'],
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
                              widget.data['height'],
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
                              widget.data['weight'],
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
                    Text(
                      'Chart Data:  ',
                      style: TextStyle(
                        color: deepPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Time (in seconds)',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Expanded(
                          child: Text(
                            'Data',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Expanded(
                          child: Text(
                            'Pulse Rate',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.data['chartData'].length,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(widget.data['chartData'][index]
                                            ['time']
                                        .toString()),
                                  ),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  Expanded(
                                    child: Text(widget.data['chartData'][index]
                                            ['data']
                                        .toString()),
                                  ),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  Expanded(
                                    child: Text(widget.data['chartData'][index]
                                            ['pulse']
                                        .toString()),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
