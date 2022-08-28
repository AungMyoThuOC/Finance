import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gitBody(),
      bottomNavigationBar: getFotter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/tabbar');
        },
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }

  gitBody() {}
  getFotter() {}
}
