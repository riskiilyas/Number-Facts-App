import 'dart:convert';
import 'package:number_facts/screens/FactTypes.dart';

import '../models/FactModel.dart';
import 'package:http/http.dart' as http;

import '../screens/FactTypes.dart';

class FactNetwork {
  Future<String> getFact(int number, FactTypes type) async {
    String url = '';
    if (type == FactTypes.trivia) {
      url = 'http://numbersapi.com/$number/trivia';
    } else if (type == FactTypes.math) {
      url = 'http://numbersapi.com/$number/math';
    } else if (type == FactTypes.year) {
      url = 'http://numbersapi.com/$number/year';
    } else if (type == FactTypes.random) {
      var list = ['trivia', 'math', 'year'];
      list.shuffle();
      String q = list.first;
      url = 'http://numbersapi.com/random/$q';
    } else {
      throw Exception("Cannot Convert Type!");
    }
    final result = await http.Client().get(Uri.parse(url));

    if (result.statusCode != 200) {
      throw Exception('Error!');
    }

    var decoded = utf8.decode(result.bodyBytes);
    return decoded;
  }

  Future<FactModel> getFactDate(int month, int day) async {
    final result = await http.Client().get(
        Uri.parse('http://numbersapi.com/$month/$day/date'));

    if (result.statusCode != 200) {
      throw Exception('Error!');
    }
    var decoded = utf8.decode(result.bodyBytes);

    return FactModel(decoded);
  }
}