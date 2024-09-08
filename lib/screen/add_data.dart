import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
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

  String? selectedGroup;
  String? selectedDistrict;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Add Donors",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
                decoration: const InputDecoration(
                    label: Text("Donor Name "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(height: 15),
            TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                    label: Text("Phone Number "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            DropdownButtonFormField(
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
                onPressed: () {},
                child: Text("Submit "),
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
}
