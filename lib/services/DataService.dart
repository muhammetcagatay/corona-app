import 'dart:convert';
import 'package:coronavirus/models/Data.dart';
import 'package:http/http.dart' as http;


class DataService {
  Future<Data> getData() async {
    final response = await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200) {
      return Data.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Parkour');
    }
  }
}
