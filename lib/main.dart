import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/add_data.dart';
import 'package:flutter_firebase/screen/mainscreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/screen/update.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        },
        'update_data': (context) {
          return UpdateDonor();
        }
      },
    );
  }
}
