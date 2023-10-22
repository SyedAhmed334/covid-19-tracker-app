// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:covid_19_tracker_app/Services/Utilities/states_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../widgets/custom_column.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  TextEditingController searchCountry = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices st = StatesServices();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchCountry,
                decoration: InputDecoration(
                  hintText: 'Search with country name',
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                  future: st.getCountriesList(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 7,
                        itemBuilder: (ctx, index) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade700,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading:
                                        buildContainer(height: 50, width: 50),
                                    title:
                                        buildContainer(height: 10, width: 90),
                                    subtitle:
                                        buildContainer(height: 10, width: 50),
                                  ),
                                  Divider(),
                                ],
                              ));
                        },
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (ctx, index) {
                            String name = snapshot.data![index]['country'];
                            if (searchCountry.text.isEmpty) {
                              return CountryColumn(
                                image: snapshot.data![index]['countryInfo']
                                    ['flag'],
                                countryName: snapshot.data![index]['country'],
                                affectedPeople: snapshot.data![index]['cases'],
                                countryMap: snapshot.data![index],
                              );
                            } else if (name
                                .toLowerCase()
                                .contains(searchCountry.text.toLowerCase())) {
                              return CountryColumn(
                                image: snapshot.data![index]['countryInfo']
                                    ['flag'],
                                countryName: snapshot.data![index]['country'],
                                affectedPeople: snapshot.data![index]['cases'],
                                countryMap: snapshot.data![index],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer({required double height, required double width}) {
    return Container(height: height, width: width, color: Colors.white);
  }
}
