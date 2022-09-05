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
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0.0, actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/setting');
          },
          // splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashRadius: 5,
          icon: Icon(
            Icons.settings,
            size: 30,
             color: Colors.black,
          ),
        ),
      ]),
    );
  }
}
