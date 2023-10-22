// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:covid_19_tracker_app/Services/Utilities/states_services.dart';
import 'package:covid_19_tracker_app/screens/country_details_screen.dart';
import 'package:flutter/material.dart';

class CountryColumn extends StatelessWidget {
  final dynamic image;
  final dynamic countryName;
  final dynamic affectedPeople;
  final dynamic countryMap;

  CountryColumn({
    required this.image,
    required this.countryName,
    required this.affectedPeople,
    required this.countryMap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryDetails(countryMap: countryMap),
              ),
            ),
          },
          leading: Image(
            image: NetworkImage(image),
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
          ),
          title: Text(countryName),
          subtitle: Text('Affected: $affectedPeople'),
        ),
        Divider(),
      ],
    );
  }
}
