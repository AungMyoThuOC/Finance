import 'dart:html';

import 'package:personal_financial/models/remaning_saving.dart';
import './models/income.dart';
import 'dart:math';
import 'firebase_options.dart';
import './models/saving.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/category.dart';

class DataRepository {
  CollectionReference ref = FirebaseFirestore.instance.collection('User');
  CollectionReference reference =
      FirebaseFirestore.instance.collection('Category');
  Future userData(String email) async {
    return await ref.doc(email).set({
      'email': email,
    });
  }

  Future updateUserData(String name) async {
    return await ref.doc(name).collection('Income').doc().set({
      'name': name,
    });
  }

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('User');

  Stream<QuerySnapshot> getAddStream() {
    return ref.doc('admin@gmail.com').collection('Income').snapshots();
  }

  Future<DocumentReference> addIncome(Income income) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Income')
        .add(income.toJson());
  }

  Stream<QuerySnapshot> getSavingStream() {
    return ref.doc('admin@gmail.com').collection('Saving').snapshots();
  }

  Future<DocumentReference> addSaving(Saving saving) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Saving')
        .add(saving.toJson());
  }

  Future updateRemaining(String id, Remaining remaining) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Saving')
        .doc(id)
        .collection("Remaining")
        .doc()
        .set({'amount': remaining.amount, 'date': remaining.date});
  }

  Future updateSaving(String id, Saving saving) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Saving')
        .doc(id)
        .update(saving.toJson());
  }

  Future deleteSaving(String id) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Saving')
        .doc(id)
        .delete();
  }

  Future deleteIncome(String id) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Income')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot> getIncome() {
    return ref.doc('admin@gmail.com').collection('Income').snapshots();
  }

  Stream<QuerySnapshot> getRemaining(String id) {
    return ref
        .doc('admin@gmail.com')
        .collection('Saving')
        .doc(id)
        .collection("Remaining")
        .snapshots();
  }

  Future deleteRemaining(String id, String remainID) async {
    return await ref
        .doc('admin@gmail.com')
        .collection('Saving')
        .doc(id)
        .collection("Remaining")
        .doc(remainID)
        .delete();
  }

  Future deleteAll() async {
    return await ref.doc('admin@gmail.com').delete();
  }

  Future<dynamic> fetchImages() async {
    List<dynamic> files = [];
    final ListResult result =
        await FirebaseStorage.instance.ref().child('Outcome').list();
    final List<Reference> allFiles = result.items;
    print(allFiles.length);

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      print('result is $fileUrl');

      files.add(
        fileUrl,
      );
    });
    FirebaseFirestore.instance.collection("Category").doc("Outcome").set({
      "url": files,
    });

    return files;
  }
}
