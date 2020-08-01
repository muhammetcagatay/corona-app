import 'package:coronavirus/screens/Home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoronaApp',
      home: SafeArea(
        child: Scaffold(
          body: Center(
 
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1577971828613-9872f39c0825?ixlib=rb-1.2.1&w=1000&q=80"),
              fit: BoxFit.cover)
              ),
              child: Center(child: Home())
               )
              ),
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(
                "CoronaApp",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
