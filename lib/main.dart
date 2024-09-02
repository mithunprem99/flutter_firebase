import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/add_data.dart';
import 'package:flutter_firebase/screen/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Mainscreen(),
      routes: {
        'add_data': (context) {
          return AddData();
        }
      },
    );
  }
}
