import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateDonor extends StatefulWidget {
  const UpdateDonor({super.key});

  @override
  State<UpdateDonor> createState() => _UpdateDonor();
}

class _UpdateDonor extends State<UpdateDonor> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  final blood_groups = [
    "A+ve",
    "B+ve",
    "A-ve",
    "B-ve",
    "AB+ve",
    "AB-ve",
    "O+ve",
    "O-ve"
  ];

  final district = [
    "Kasargod",
    "Kannur",
    "Kozhikode",
    "Wayanad",
    "Malappuram",
    "Palakkad",
    "Thrissur",
    "Ernakulam",
    "Idukki",
    "Kottayam",
    "Alappuzha",
    "Pathanamthitta",
    "Kollam",
    "Trivandrum"
  ];
  final _donorName = TextEditingController();
  final _phone = TextEditingController();
  // final _group = TextEditingController();
  // final _district = TextEditingController();
  String? selectedGroup;
  String? selectedDistrict;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _donorName.text = args['name'];
    _phone.text = args['phone'];
    selectedGroup = args['group'];
    selectedDistrict = args['district'];
    final docId = args['id'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Update Details",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
                controller: _donorName,
                decoration: const InputDecoration(
                    label: Text("Donor Name "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(height: 15),
            TextFormField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                    label: Text("Phone Number "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            DropdownButtonFormField(
                value: selectedGroup,
                decoration: const InputDecoration(
                    label: Text("Select Blood Group"),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10)))),
                items: blood_groups
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedGroup = val;
                }),
            SizedBox(
              height: 15,
            ),
            DropdownButtonFormField(
                value: selectedDistrict,
                decoration: const InputDecoration(
                    label: Text("Select district"),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10)))),
                items: district
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedDistrict = val;
                }),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  updateDonor(docId);
                  print(args);
                  Navigator.pop(context);
                },
                child: Text("Update "),
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)))
          ],
        ),
      ),
    );
  }

  void updateDonor(id) {
    final data = {
      'name': _donorName.text,
      'phone': _phone.text,
      'group': selectedGroup,
      'district': selectedDistrict
    };
    donor.doc(id).update(data);
  }
}
