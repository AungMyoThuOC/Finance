import 'package:finance/register.dart';
import 'package:finance/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'get_start.dart';
import 'homepage.dart';
import 'login.dart';
import 'income.dart';
import 'outcome.dart';
// import 'verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartPage(),
        '/register': (context) => const RegisterPage(),
        // '/verify': (context) => const VerifyScreen(),
        '/login' : (context) => const LoginPage(),
        '/home' : (context) => const HomePage(),
        '/tabbar' :(context) => const TabBarPage(),
        '/income' : (context) => const IncomePage(),
        '/outcome' : (context) =>  const OutcomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Finance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
