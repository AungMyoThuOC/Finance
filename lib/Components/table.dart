import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_financial/data_repository.dart';
import 'package:personal_financial/models/income.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_financial/models/remaning_saving.dart';
import 'package:personal_financial/models/saving.dart';

class TableInOutCome extends StatefulWidget {
  const TableInOutCome({Key? key}) : super(key: key);

  @override
  State<TableInOutCome> createState() => _TableInOutComeState();
}

class _TableInOutComeState extends State<TableInOutCome> {
  double sum = 0;
  double total = 0;
  double saving = 0;
  double tot = 0;
  final DataRepository repository = DataRepository();

  void getIncomeSum() {
    FirebaseFirestore.instance
        .collection('User')
        .doc('admin@gmail.com')
        .collection('Income')
        .get()
        .then(
      (StreamBuilder) {
        StreamBuilder.docs.forEach((result) {
          sum = sum + result.data()['amount'];
        });
        setState(() {
          total = sum;
        });
      },
    );
  }

  void getRemaining() {
    FirebaseFirestore.instance
        .collection('User')
        .doc('admin@gmail.com')
        .collection('Saving')
        .get()
        .then(
      (StreamBuilder) {
        StreamBuilder.docs.forEach((result) {
          saving = saving + result.data()['amount'];
        });
        setState(() {
          tot = saving;
          print(tot);
        });
      },
    );
  }

  @override
  void initState() {
    getRemaining();
    getIncomeSum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          child: StreamBuilder<QuerySnapshot>(
              stream: repository.getIncome(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                var ds = snapshot.data!.docs;
                double sum = 0.0;
                for (int i = 0; i < ds.length; i++)
                  sum += (ds[i]['amount']).toDouble();
                return Text('');
              }),
        ),
        Table(defaultColumnWidth: const FixedColumnWidth(130.0), children: [
          TableRow(children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Text(
                'Income',
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                '${sum}',
                textAlign: TextAlign.end,
              ),
            ),
          ]),
          TableRow(children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Saving',
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                '${tot}',
                textAlign: TextAlign.end,
              ),
            )
          ]),
          const TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Outcome',
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                '1000',
                textAlign: TextAlign.end,
              ),
            )
          ])
        ]),
      ],
    );
  }
}