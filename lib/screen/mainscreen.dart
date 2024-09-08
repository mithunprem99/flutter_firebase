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
            stream: donor.snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot donorSnap =
                          snapshot.data.docs[index];
                      // return Text(donorSnap['name']);
                      return Container(
                        height: 80,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Container(
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 30,
                                  child: Text(donorSnap['group'],style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(donorSnap['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text(donorSnap['phone'].toString(),style: TextStyle(fontSize: 18),)

                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),

                                ],
                              )
                          ],
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
}
