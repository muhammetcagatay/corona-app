import 'package:coronavirus/models/Data.dart';
import 'package:coronavirus/screens/Global.dart';
import 'package:coronavirus/screens/MyCountry.dart';
import 'package:coronavirus/services/DataService.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatefulWidget {
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  List<Widget> sayfalar = [
    MyCountry(0),
    Global1(),
  ];
  int index = 0;

  bool myCountry = true;
  bool global = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Data>(
      future: DataService().getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blue[800],
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white38,
                      width: MediaQuery.of(context).size.width * 8 / 9,
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  myCountry = true;
                                  global = false;
                                  index = 0;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "MyCountry",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: myCountry
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 4 / 9,
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  color: myCountry ? Colors.white : null,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  myCountry = false;
                                  global = true;
                                  index = 1;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Global",
                                      style: TextStyle(
                                          color: global
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 4 / 9,
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  color: global ? Colors.white : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 500000,
                  ),
                  sayfalar[index],
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }
}
