import 'dart:convert';

import 'package:covid_19_tracker_app/Services/Utilities/app_url.dart';

import '../../Models/WorldStateModel.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStateModel> getWorldStates() async {
    var response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> getCountriesList() async {
    var response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('No data found');
    }
  }
}
