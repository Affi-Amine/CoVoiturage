import 'package:covoiturage/screens/home/home_screen.dart';
import 'package:covoiturage/screens/publish/location_field.dart';
import 'package:flutter/material.dart';


void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
