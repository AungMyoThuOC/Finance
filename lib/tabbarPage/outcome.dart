import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cool_dropdown/cool_dropdown.dart';

class OutcomePage extends StatefulWidget {
  const OutcomePage({Key? key}) : super(key: key);

  @override
  State<OutcomePage> createState() => _OutcomePageState();
}

class _OutcomePageState extends State<OutcomePage> {
  final items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  String? value;

  TextEditingController amountCont = TextEditingController();
  TextEditingController categoryCont = TextEditingController();
  TextEditingController datecont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       Container(
                //         height: 45,
                //         decoration: BoxDecoration(
                //             color: Colors.grey[300],
                //             borderRadius: BorderRadius.circular(10.0)),
                //         child: TabBar(
                // indicator: BoxDecoration(
                //     color: Colors.green[300],
                //     borderRadius: BorderRadius.circular(10.0)),
                // labelColor: Colors.white,
                // unselectedLabelColor: Colors.black,
                // tabs: const [
                //   Tab(
                //     text: 'Income',
                //   ),
                //   Tab(
                //     text: 'Outcome',
                //   ),
                // ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.number,
                      controller: amountCont,
                      // textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        hintText: "Amount",
                        // hintStyle: TextStyle(color: Colors.blue),
                      ),
                    )),

                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.payment,
                          size: 50,
                          color: Colors.green,
                        ),
                        Text(
                          "Paycheck",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.green,
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.number,
                  controller: categoryCont,
                  // textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "New Category",
                    // hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Icon(Icons.date_range),
                TextFormField(
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.number,
                  controller: datecont,
                  // textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Date",
                    // hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        final income = categoryCont.text;

                        createIncome(income: income);
                      },
                      child: const Text("Add Outcome")),
                )
              ])),
        ),
      ),
    );
  }

  Future createIncome({required String income}) async {
    // Reference to document
    final docIncome =
        FirebaseFirestore.instance.collection('users').doc('my-id');

    final user = User(
      id: docIncome.id,
      income: income,
      data: DateTime,
    );
    final json = user.toJson();

    // Create document and write data to Firebase
    await docIncome.set(json);
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
}

class User {
  late String id;
  String income;
  late final date;

  User({
    this.id = '',
    required this.income,
    required data,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'income': income,
        'date': date,
      };
}
