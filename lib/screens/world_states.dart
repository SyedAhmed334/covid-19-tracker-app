// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid_19_tracker_app/Models/WorldStateModel.dart';
import 'package:covid_19_tracker_app/Services/Utilities/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/custom_row.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(
    //   Duration(seconds: 5),
    //       () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => WorldStatesScreen(),
    //     ),
    //   ),
    // );
  }

  final pieColors = [
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices st = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              FutureBuilder(
                future: st.getWorldStates(),
                builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitFadingCircle(
                      controller: _controller,
                      color: Colors.white,
                      size: 50.0,
                    ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": snapshot!.data!.cases!.toDouble(),
                            "Recovered": snapshot.data!.recovered!.toDouble(),
                            "Deaths": snapshot.data!.deaths!.toDouble(),
                          },
                          chartType: ChartType.ring,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          colorList: pieColors,
                          degreeOptions:
                              DegreeOptions(initialAngle: 0, totalDegrees: 360),
                          animationDuration: Duration(milliseconds: 1200),
                          legendOptions: LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: true),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            color: Colors.grey.shade800,
                            child: Column(
                              children: [
                                CustomRow(
                                    title: 'Total Cases',
                                    value: snapshot!.data!.cases.toString()),
                                Divider(),
                                CustomRow(
                                    title: 'Deaths',
                                    value: snapshot!.data!.deaths.toString()),
                                Divider(),
                                CustomRow(
                                    title: 'Recovered',
                                    value:
                                        snapshot!.data!.recovered.toString()),
                                Divider(),
                                CustomRow(
                                    title: 'Active',
                                    value: snapshot!.data!.active.toString()),
                                Divider(),
                                CustomRow(
                                    title: 'Critical',
                                    value: snapshot!.data!.critical.toString()),
                                Divider(),
                                CustomRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot!.data!.todayDeaths.toString()),
                                Divider(),
                                CustomRow(
                                    title: 'Today Recovered',
                                    value: snapshot!.data!.todayRecovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
