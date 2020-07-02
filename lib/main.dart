import 'package:coronavirus/screens/Home.dart';
import 'package:coronavirus/screens/CountrySelect.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    Home(),
    CountrySelect(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoronaApp',
      home: Scaffold(
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('AnaSayfa'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('Ülke Değiştir'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "CoronaApp",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
