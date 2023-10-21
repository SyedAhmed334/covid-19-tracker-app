import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryColumn extends StatelessWidget {
  final image;
  final country;
  final affectedPeople;

  CountryColumn(
      {required this.image,
      required this.country,
      required this.affectedPeople});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image(
            image: NetworkImage(image),
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
          ),
          title: Text(country),
          subtitle: Text('Affected: $affectedPeople'),
        ),
        Divider(),
      ],
    );
  }
}
