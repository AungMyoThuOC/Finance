import 'package:flutter/material.dart';

class GetStartPage extends StatefulWidget {
  const GetStartPage({Key? key}) : super(key: key);

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  bool isLoading = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('images/whatsappbg.jpg'), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Automatic identity verification which enables you to verify your identity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/Plastic-money.png'))),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 3));
                                      Navigator.pushNamed(context, '/register');
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    // style: ElevatedButton.styleFrom(
                                    //     primary: Color.fromARGB(235, 22, 172, 132)),
                                    child: (isLoading)
                                        ? const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 1.5,
                                            ),
                                          )
                                        : const Text(
                                            "Register",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: MaterialButton(
                                    onPressed: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 3));
                                      Navigator.pushNamed(context, '/login');
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.black)),
                                    // style: ElevatedButton.styleFrom(
                                    //     primary:
                                    //         const Color.fromARGB(255, 135, 19, 41)),
                                    child: (loading)
                                        ? const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                              strokeWidth: 1.5,
                                            ),
                                          )
                                        : const Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
