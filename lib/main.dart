// ignore_for_file: prefer_const_constructors

import 'package:covid_19_tracker_app/screens/splash_screen.dart';
import 'package:covid_19_tracker_app/screens/world_states.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: WorldStatesScreen(),
    );
  }
}
