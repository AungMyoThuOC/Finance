import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_financial/Components/home_history.dart';
import 'package:personal_financial/models/income.dart';
import 'package:personal_financial/views/saving_add.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'Components/pie_chart.dart';
import 'Components/table.dart';
import 'firebase_options.dart';
import 'data_repository.dart';
import 'models/income.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/saving_dash.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'views/saving_details.dart';
import 'views/addInOut.dart';
import 'first_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/saving_add': (context) => SavingAdd(),
        '/add': (context) => const AddInOut(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
