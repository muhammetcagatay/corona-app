import 'package:coronavirus/models/Data.dart';
import 'package:coronavirus/services/DataService.dart';
import 'package:flutter/material.dart';

class MyCountry extends StatefulWidget {
  int index;
  MyCountry(this.index);
  @override
  _MyCountryState createState() => _MyCountryState(index);
}

class _MyCountryState extends State<MyCountry> {
  int index ;
  _MyCountryState(this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder<Data>(
          future: DataService().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          color: Colors.yellow[800],
                          width: MediaQuery.of(context).size.width * 5 / 11,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Bugünkü Vaka Sayısı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.countries[index].newConfirmed
                                          .toString() ,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          color: Colors.yellow[900],
                          width: MediaQuery.of(context).size.width * 5 / 11,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Toplam Vaka Sayısı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.countries[index].totalConfirmed
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          color: Colors.red[600],
                          width: MediaQuery.of(context).size.width * 5 / 11,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Bugünkü Vefat Sayısı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.countries[index].newDeaths
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          color: Colors.red[800],
                          width: MediaQuery.of(context).size.width * 5 / 11,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Toplam Vefat Sayısı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.countries[index].totalDeaths
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          color: Colors.green[500],
                          width: MediaQuery.of(context).size.width * 5 / 11,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Bugünkü İyileşen Sayısı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.countries[index].newRecovered
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          color: Colors.green[700],
                          width: MediaQuery.of(context).size.width * 5 / 11,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Toplam İyileşen Sayısı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.countries[index].totalRecovered
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
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
