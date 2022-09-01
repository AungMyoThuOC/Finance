import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  
  TextEditingController currpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confipass = TextEditingController();

  // bool showpass = true;
  bool currshowpass = true;
  bool newshowpass = true;
  bool confishowpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Security",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.blue, fontSize: 15),
                  cursorColor: Colors.blue,
                  controller: currpass,
                  obscuringCharacter: "*",
                  obscureText: currshowpass,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    // labelStyle: TextStyle(
                    //   color: Colors.blue,
                    // ),
                    // labelText: "Email",
                    hintText: "Current Password",
                    hintStyle: const TextStyle(color: Colors.blue),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            currshowpass = !currshowpass;
                          });
                        },
                        splashRadius: 5,
                        icon: currshowpass
                            ? const Image(
                                image: AssetImage(
                                  'images/hidepass.png'
                                ),
                              )
                            : const Image(image: AssetImage(
                              'images/showpass.png'
                              )
                            )
                          ),
                    prefixIconConstraints:
                        const BoxConstraints(maxHeight: 10, minWidth: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.blue, fontSize: 15),
                  cursorColor: Colors.blue,
                  controller: newpass,
                  obscuringCharacter: "*",
                  obscureText: newshowpass,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    // labelStyle: TextStyle(
                    //   color: Colors.blue,
                    // ),
                    // labelText: "Email",
                    hintText: "New Password",
                    hintStyle: const TextStyle(color: Colors.blue),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            newshowpass = !newshowpass;
                          });
                        },
                        splashRadius: 5,
                        icon: newshowpass
                            ? const Image(
                                image: AssetImage(
                                  'images/hidepass.png'
                                ),
                              )
                            : const Image(image: AssetImage(
                              'images/showpass.png'
                              )
                            )
                          ),
                    prefixIconConstraints:
                        const BoxConstraints(maxHeight: 10, minWidth: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.blue, fontSize: 15),
                  cursorColor: Colors.blue,
                  controller: confipass,
                  obscuringCharacter: "*",
                  obscureText: confishowpass,
                  decoration: InputDecoration(
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 10, minWidth: 20),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      // labelStyle: TextStyle(
                      //   color: Colors.blue,
                      // ),
                      // labelText: "Email",
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(color: Colors.blue),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confishowpass = !confishowpass;
                            });
                          },
                          splashRadius: 5,
                          icon: confishowpass
                              ? const Image(
                                  image: AssetImage(
                                    'images/hidepass.png'
                                  ),
                                )
                              : const Image(image: AssetImage(
                                'images/showpass.png'
                                )
                              )
                            )
                          ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text("Save"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
