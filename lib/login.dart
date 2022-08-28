import 'package:finance/reset.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'forgotpass.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showpass = true;
  bool valid = false;

  bool submit = false;

  bool check = false;

  bool isLoading = false;

  final _fromKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromKey,
        child: Center(
          child: Stack(
            children: <Widget>[
              // Container(
              //   height: 400,
              //   width: 500,
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 30,
              //     vertical: 25,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     borderRadius: BorderRadius.circular(10),
              //     shape: BoxShape.rectangle
              //   ),
            
              
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('images/bglogin.jpg'),
            //         fit: BoxFit.cover)),
            // child: Container(
            //   width: double.infinity,
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(onPressed: onPressed, icon: icon)
            // ],)
            // ],
            //     ),
            //   ),
            // )
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autocorrect: false,
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    controller: emailController,
                    validator: (user) {
                      if (user == null || user.isEmpty) {
                        return "Email can't be blank";
                      }
                      // else if (user.length < 6) {
                      //   return "email  should be more than 6 word";
                      // }
                      else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        labelText: "Email",
                        hintText: "Enter your Email",
                        hintStyle: TextStyle(color: Colors.blue),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.blue,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    controller: passwordController,
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
                        labelStyle: const TextStyle(color: Colors.blue),
                        labelText: "Password",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ResetScreen())),
                      //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ForgotPasswordPage(),
                      //   )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            final String? username = prefs.getString('UserID');
                            setState(() {
                              submit = true;
                              print('$username');
                            });
                            if (_fromKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                final auth = FirebaseAuth.instance;
                                UserCredential currentUser =
                                    await auth.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                print(currentUser.user!.uid);
                                if (currentUser.user!.uid != null) {
                                  isLoading = false;
                                  // ignore: use_build_context_synchronously
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/'));
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                  emailController.clear();
                                  passwordController.clear();
                                }
                              } on FirebaseException catch (e) {
                                if (e.code == 'user-not-found') {
                                  errorMessage =
                                      'No user found with this E-mail';
                                } else if (e.code == 'wrong-password') {
                                  errorMessage = ' Wrong password !';
                                } else {
                                  errorMessage = e.code;
                                }
                                setState(() {
                                  isLoading = false;
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(errorMessage),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2)));
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(e.toString()),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2)));
                              }
                            }
                          },
                          // style: ElevatedButton.styleFrom(
                          //     primary: const Color.fromARGB(235, 229, 60, 60)),
                          child: (isLoading)
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.5,
                                  ),
                                )
                              : const Text("Login")),
                    )),
              ],
            ),
            ]
            ),
          ),
        ),
      );
  }
}
