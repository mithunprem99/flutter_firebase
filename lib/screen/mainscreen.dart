import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Blood Donation",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 209, 167, 27),
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: const SafeArea(child: Text("data")),
        backgroundColor: Colors.white);
  }

  void navigateToAdd(BuildContext context) {
    Navigator.of(context).pushNamed('add_data');
  }
}
