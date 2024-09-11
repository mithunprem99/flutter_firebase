import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
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
            onPressed: () {
              navigateToAdd(context);
            },
            backgroundColor: const Color.fromARGB(255, 209, 167, 27),
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: StreamBuilder(
            stream: donor.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot donorSnap =
                          snapshot.data.docs[index];
                      // return Text(donorSnap['name']);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                const BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 182, 179, 179),
                                    blurRadius: 10,
                                    spreadRadius: 15)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 30,
                                    child: Text(
                                      donorSnap['group'],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    donorSnap['name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    donorSnap['phone'].toString(),
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      navigateToUpdate(context, donorSnap);
                                    },
                                    icon: const Icon(Icons.edit),
                                    color: Colors.blue,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteRecord(donorSnap.id); 
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Container();
              }
            }));
  }

  void navigateToAdd(BuildContext context) {
    Navigator.of(context).pushNamed('add_data');
  }

  void navigateToUpdate(BuildContext context, DocumentSnapshot donorSnap) {
    Navigator.of(context).pushNamed('update_data', arguments: {
      'name': donorSnap['name'],
      'phone': donorSnap['phone'].toString(),
      'group': donorSnap['group'],
      'district': donorSnap['district'],
      'id': donorSnap.id
    });
  }

void deleteRecord(String donorId) async {
  try {
    // Delete the document from Firestore using its ID
    await FirebaseFirestore.instance.collection('donor').doc(donorId).delete();

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Donor record deleted successfully')),
    );
  } catch (e) {
    // Show an error message if something goes wrong
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to delete donor record: $e')),
    );
  }
}

}
