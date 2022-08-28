import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cool_dropdown/cool_dropdown.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

// class FirestoreSevice {
//   final CollectionReference _incomeCollectionReference =
//       Firestore.instance.collection('my-id');

//   Future myid(id) async {
//     try {
//       await _incomeCollectionReference.id;
//       return true;
//     } catch (e) {
//       return e.toString();
//     }
//   }
// Future getPostsOnceOff() async {
//   try {
//     var postDocuments = await _postsCollectionReference.getDocuments();
//     if (postDocuments.documents.isNotEmpty) {
//       return postDocuments.documents
//           .map((snapshot) => Post.fromMap(snapshot.data))
//           .where((mappedItem) => mappedItem.title != null)
//           .toList();
//     }
//   } catch (e) {
//     if (e is PlatformException) {
//       return e.message;
//     }
//     return e.toString();
//   }
//   }
// }

// class CreateIncomeModel extends BaseModel {
//   final FirestoreSevice _firestoreService = locator<FirestoreService>();
//   final Dialog _dialogService = locator<DialogService>();
//   final NavigationBar _navigationService = locator<NavigationService>();
//   Future addPost({required String title}) async {
//     setBusy(true);
//     var result = await _firestoreService.addPost(Post(
//         title: title,
//         userId: currentUser.id)); // We need to add the current userId
//     setBusy(false);
//     if (result is String) {
//       await _dialogService.showDialog(
//         title: 'Could not add Post',
//         description: result,
//       );
//     } else {
//       await _dialogService.showDialog(
//         title: 'Post successfully Added',
//         description: 'Your post has been created',
//       );
//     }
//     _navigationService.pop();
//   }
// }

// class BaseModel extends ChangeNotifier {
//    final AuthenticatorAssertionResponse _authenticationService =
//       locator<AuthenticationService>();
//   User get currentUser => _authenticationService.currentUser;

//   FloatingActionButton(
//     child !model.busy
//         ? Icon(Icons.add)
//         : CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation(Colors.white),
//           ),
//     onPressed: () {
//       // Call the function to create the post
//       if (!model.busy)
//         model.addPost(
//           title: titleController.text,
//         );
//     },
//   )
// }

class _IncomePageState extends State<IncomePage> {
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
        // appBar: AppBar(
        //   bottom: const TabBar(
        //     tabs: [
        //       Tab(text: 'Income',),
        //       Tab(text: 'Outcome',)
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
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
                //           indicator: BoxDecoration(
                //               color: Colors.green[300],
                //               borderRadius: BorderRadius.circular(10.0)),
                //           labelColor: Colors.white,
                //           unselectedLabelColor: Colors.black,
                //           tabs: const [
                //             Tab(
                //               text: 'Income',
                //             ),
                //             Tab(
                //               text: 'Outcome',
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
               
                // SizedBox(
                //     height: 20,
                //     child: TabBarView(
                //       children: [
                //         Container(
                //           child: Text(
                //             "Income",
                //           ),
                //         ),
                //         Container(
                //           child: Text(
                //             "Outcome"
                //           ),
                //         )
                //       ],
                //     )),
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
                          Icons.business_center,
                          size: 50,
                          color: Colors.green,
                        ),
                        Text(
                          "Workout",
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
                // Container(
                //     child: Column(children: [
                //   Container(
                //     margin: const EdgeInsets.all(16),
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: Colors.black, width: 4)),
                // child: DropdownButtonHideUnderline(
                //   child: DropdownButton<String>(
                //     value: value,
                //     iconSize: 36,
                //     icon: const Icon(
                //       Icons.arrow_drop_down,
                //       color: Colors.black,
                //     ),
                //     isExpanded: true,
                //     items: items.map(buildMenuItem).toList(),
                //     onChanged: (value) =>
                //         setState(() => this.value = value),
                //   ),
                // ),

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
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          final income = categoryCont.text;

                          createIncome(income: income);
                        },
                        child: const Text("Add Income")),
                  ),
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
