// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../widgets/custom_row.dart';

class CountryDetails extends StatelessWidget {
  final dynamic countryMap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(countryMap['country'])),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06),
                  child: Card(
                    color: Colors.grey.shade800,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          CustomRow(
                            title: 'Cases',
                            value: countryMap['cases'].toString(),
                          ),
                          Divider(),
                          CustomRow(
                              title: 'Recovered',
                              value: countryMap['recovered'].toString()),
                          Divider(),
                          CustomRow(
                              title: 'Deaths',
                              value: countryMap['deaths'].toString()),
                          Divider(),
                          CustomRow(
                              title: 'Critical',
                              value: countryMap['critical'].toString()),
                          Divider(),
                          CustomRow(
                            title: 'Today Recovered',
                            value: countryMap['todayRecovered'].toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 150,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    countryMap['countryInfo']['flag'].toString(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CountryDetails({required this.countryMap});
}
