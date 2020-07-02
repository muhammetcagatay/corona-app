import 'package:coronavirus/models/Data.dart';
import 'package:coronavirus/screens/Home.dart';
import 'package:coronavirus/services/DataService.dart';
import 'package:flutter/material.dart';

class CountrySelect extends StatefulWidget {
  @override
  _CountrySelectState createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Data>(
      future: DataService().getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.countries.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Home();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 13,
                    color: Colors.blueGrey,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Text(snapshot.data.countries[index].countryCode),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                        Text(snapshot.data.countries[index].country),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }
}