// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// class ColorItem {
//   ColorItem(this.name, this.color);
//   final String name;
//   final Color color;
// }

class _RegisterPageState extends State<RegisterPage> {
  // final List<ColorItem> items = [
  //   // ColorItem("white", Colors.white),
  //   // ColorItem("Cyan", Colors.cyan),
  //   // ColorItem("Grey", Colors.grey),
  //   ColorItem("Black", Colors.black),
  //   ColorItem("Blue", Colors.blue),
  //   ColorItem("Red", Colors.red),
  //   ColorItem("Green", Colors.green),
  //   // ColorItem("Yellow", Colors.yellow),
  //   // ColorItem("Orange", Colors.orange),
  // ];

  // late ColorItem currentChoice;

  bool showpass = true;
  bool valid = false;
  bool submit = false;

  bool check = false;

  // bool isLoading = false;

  final _fromKey = GlobalKey<FormState>();

  TextEditingController userCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  var errorMessage = '';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   currentChoice = items[0];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
      //   elevation: 0.0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.live_help,
      //       ),
      //     )
      //   ],
      // ),
      body: Form(
        key: _fromKey,
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red.shade700, Colors.red.shade200])),
            child: Container(
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
                    .copyWith(topRight: Radius.circular(0)),
                gradient: LinearGradient(colors: [Colors.red, Colors.white]),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                        controller: userCont,
                        validator: (user) {
                          if (user == null || user.isEmpty) {
                            return "Username can't be blank";
                          } else if (user.length < 6) {
                            return "Username should be more than 6 word";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.blue),
                            hintText: "Enter your username",
                            hintStyle: TextStyle(color: Colors.blue),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                        controller: emailCont,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return "Email can't be blank";
                          } else if (email.length < 6) {
                            return "Username should be more than 6 word";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.blue),
                            hintText: "Enter your email",
                            hintStyle: TextStyle(color: Colors.blue),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                        controller: passCont,
                        obscuringCharacter: "*",
                        obscureText: showpass,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return "Password can't be blank";
                          } else if (password.length < 6) {
                            return "Password should be 6 word";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.blue),
                            hintText: "Enter your password",
                            hintStyle: const TextStyle(color: Colors.blue),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.blue,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showpass = !showpass;
                                  });
                                },
                                splashRadius: 5,
                                icon: showpass
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.blue,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.blue,
                                      ))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              EasyLoading.show(
                                  status: 'loading...',
                                  maskType: EasyLoadingMaskType.black);
                              submit = true;
                              // isLoading = true;
                            });
                            // await Future.delayed(const Duration(seconds: 3));
                            if (_fromKey.currentState!.validate()) {
                              try {
                                final auth = FirebaseAuth.instance;

                                final newUser =
                                    await auth.createUserWithEmailAndPassword(
                                        email: emailCont.text,
                                        password: passCont.text);

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();

                                prefs.setString('UserID', newUser.user!.uid);

                                setState(() {
                                  // isLoading = false;
                                  Navigator.pushNamed(context, '/login');
                                  userCont.clear();
                                  passCont.clear();
                                });
                              } on FirebaseException catch (e) {
                                if (e.code == 'user-not-found') {
                                  errorMessage =
                                      'No user found with this E-mail';
                                } else if (e.code == 'wrong-password') {
                                  errorMessage = ' Wrong password !';
                                } else {
                                  errorMessage = e.code;
                                }
                                // setState(() {
                                //   isLoading = false;
                                // });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(errorMessage),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2)));
                              } catch (e) {
                                print(e);
                                // setState(() {
                                //   isLoading = false;
                                // });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(e.toString()),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2)));
                              }
                            }

                            // if (_fromKey.currentState!.validate()) {
                            //   SharedPreferences prefs =
                            //       await SharedPreferences.getInstance();
                            //   prefs.setString('userValue', userCont.text);
                            //   prefs.setString('passValue', passCont.text);
                            //   setState(() {
                            //     Navigator.pushNamed(context, '/login');
                            //     userCont.clear();
                            //     passCont.clear();
                            //   });
                            EasyLoading.showError('Failed with Error');
                            EasyLoading.showSuccess("Great Success!");
                          },
                          // style: ElevatedButton.styleFrom(
                          //     primary: Color.fromARGB(235, 229, 60, 60)),
                          child:
                              // (isLoading)
                              //     ? const SizedBox(
                              //         width: 16,
                              //         height: 16,
                              //         child: CircularProgressIndicator(
                              //           color: Colors.white,
                              //           strokeWidth: 1.5,
                              //         ),
                              //       )
                              //     :
                              const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Existing user?",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              'login',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Row(
                    //   children: [
                    //     IconButton(
                    //       onPressed: (){},
                    //       icon: Icon(Icons.arrow_back)
                    //     )
                    //   ],
                    // Column(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     const Text(
                    //       "What is your Fav Color",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 30,
                    //       ),
                    //     ),
                    //     // Icon(
                    //     //   Icons.face,
                    //     //   color: currentChoice.color,
                    //     //   size: 100.0,
                    //     // ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: DropdownButton(
                    //         isExpanded: true,
                    //         style: Theme.of(context).textTheme.headline6,
                    //         value: currentChoice,
                    //         selectedItemBuilder: (BuildContext context) => items
                    //             .map<Widget>((ColorItem item) => Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: <Widget>[
                    //                     Padding(
                    //                         padding: const EdgeInsets.only(
                    //                             right: 16.0),
                    //                         child: Icon(Icons.palette,
                    //                             color: item.color)),
                    //                     Text(item.name),
                    //                   ],
                    //                 ))
                    //             .toList(),
                    //         items: items
                    //             .map<DropdownMenuItem<ColorItem>>(
                    //                 (ColorItem item) =>
                    //                     DropdownMenuItem<ColorItem>(
                    //                       value: item,
                    //                       child: Container(
                    //                           alignment: Alignment.center,
                    //                           constraints: const BoxConstraints(
                    //                               minHeight: 48.0),
                    //                           color: item.color,
                    //                           child: Text(
                    //                             item.name,
                    //                             style: TextStyle(
                    //                               color: ThemeData
                    //                                           .estimateBrightnessForColor(
                    //                                               item.color) ==
                    //                                       Brightness.dark
                    //                                   ? Colors.white
                    //                                   : Colors.black,
                    //                             ),
                    //                           )),
                    //                     ))
                    //             .toList(),
                    //         onChanged: (ColorItem? value) =>
                    //             setState(() => currentChoice = value!),
                    //       ),
                    //     ),
                    //   ],
                    // ),
