import 'package:covid_app/data/data_source.dart';
import 'package:covid_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular', primaryColor: primaryBlack),
    home: HomeScreen(),
  ));
}
