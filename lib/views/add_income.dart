import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:personal_financial/firebase_options.dart';
import 'package:personal_financial/data_repository.dart';
import 'package:personal_financial/models/income.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddIncome extends StatefulWidget {
  AddIncome({Key? key}) : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  TextEditingController categoryController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  bool choose = true;
  List<IconData> navBarItem = [
    Icons.family_restroom,
    Icons.cast_for_education,
    Icons.home,
    Icons.car_crash,
    Icons.shop,
    Icons.phone
  ];

  bool newCategory = false;
  List<dynamic> list = [];
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.transparent,
            height: 600,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.man,
                            size: 35,
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                              controller: amountController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Amount",
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 224, 224, 224)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 177, 177, 177)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(children: const [
                            Text(
                              "Categories",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ]),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                          Container(
                            height: 200,
                            child: GridView.count(
                              mainAxisSpacing: 10.0,
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 2,
                              children: List.generate(
                                7,
                                (index) => Center(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.blueAccent,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        navBarItem[index],
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  //     child: IconButton(
                                  //   onPressed: () {},
                                  //   icon: Icon(
                                  //     navBarItem[index],
                                  //     color: Colors.white,
                                  //   ),
                                  // )),
                                ),
                              ),
                            ),
                            // Container(
                            //     height: 50,
                            //     child: ListView.builder(
                            //         shrinkWrap: true,
                            //         scrollDirection: Axis.horizontal,
                            //         itemCount: navBarItem.length,
                            //         itemBuilder: (context, index) {
                            //           return InkWell(
                            //             onTap: () {
                            //               print(navBarItem[index]);
                            //             },
                            //             child: Container(
                            //               padding: EdgeInsets.symmetric(
                            //                   horizontal: 10, vertical: 10),
                            //               margin:
                            //                   EdgeInsets.symmetric(horizontal: 5),
                            //               decoration: BoxDecoration(
                            //                   color: Colors.blueAccent,
                            //                   borderRadius:
                            //                       BorderRadius.circular(15)),
                            //               child: Center(
                            //                 child: Icon(
                            //                   navBarItem[index],
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //           );
                            //         })),
                          )
                        ],
                      ),
                    ),
                    if (newCategory == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.email_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              controller: categoryController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "New Category",
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 224, 224, 224)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 177, 177, 177)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 30,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: categoryController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "DateTime",
                              hintStyle: const TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 224, 224, 224)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 177, 177, 177)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            if (amountController.text != null &&
                                categoryController.text != null) {
                              DataRepository().addIncome(Income(
                                  int.parse(amountController.text),
                                  date: DateTime.now(),
                                  category: categoryController.text));
                            }
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
