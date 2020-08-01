import 'package:coronavirus/models/Data.dart';
import 'package:coronavirus/screens/home_screens/Global.dart';
import 'package:coronavirus/screens/home_screens/MyCountry.dart';
import 'package:coronavirus/services/DataService.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> sayfalar = [
    MyCountry(172),
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
              
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                   ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 18,
                      color: Colors.white60,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                           getDay(snapshot.data.date
                                  .toString()
                                  .substring(8, 10)) +
                              " " +
                              getMonth(snapshot.data.date
                                  .toString()
                                  .substring(5, 7)) +
                              " " +
                              snapshot.data.date.toString().substring(0, 4),
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.black26,
                       height:
                                      MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width * 72 / 81,
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
                                      "Türkiye",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: myCountry
                                              ? Colors.black
                                              : Colors.blueGrey[700]),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 36 / 83,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: myCountry ? Colors.white70 : null,
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
                                              :  Colors.blueGrey[700],
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 36 / 83,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: global ? Colors.white70 : null,
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
   String getDay(String day) {
    if (day[0] == "0") {
      return day[1];
    } else {
      return day;
    }
  }

  String getMonth(String month) {
    if (month == "01") {
      return "Ocak";
    }
    if (month == "02") {
      return "Şubat";
    }
    if (month == "03") {
      return "Mart";
    }
    if (month == "04") {
      return "Nisan";
    }
    if (month == "05") {
      return "Mayıs";
    }
    if (month == "06") {
      return "Haziran";
    }

    if (month == "07") {
      return "Temmuz";
    }
    if (month == "08") {
      return "Ağustos";
    }

    if (month == "09") {
      return "Eylül";
    }
    if (month == "10") {
      return "Ekim";
    }
    if (month == "11") {
      return "Kasım";
    }
    if (month == "12") {
      return "Aralık";
    }
  }

}
