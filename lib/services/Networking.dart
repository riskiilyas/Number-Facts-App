import 'dart:convert';
import 'dart:math';

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
      url = 'https://numbersapi.com/$number/math';
    } else if(type == FactTypes.year) {
      // return getFactYear(number);
    } else if(type == FactTypes.random) {
      var list = ['trivia', 'math', 'year'];
      list.shuffle();
      String q = list.first;
      url = 'https://numbersapi.com/random/$q';
    } else {
      print('ERROR');
      throw Exception("Cannot Convert Type!");
    }
    final result = await http.Client().get(Uri.parse(url));
    
    if(result.statusCode != 200) {
      print('ERROR 22');
      throw Exception('Error!');
    }

    var decoded = utf8.decode(result.bodyBytes);
    // return toModelNumber(result.body);
    return decoded;
  }

  Future<FactModel> getFactDate(int month, int day) async {
    final result = await http.Client().get(Uri.parse('https://numbersapi.com/$month/$day/date'));

    if(result.statusCode != 200) {
      throw Exception('Error!');
    }

    return toModelDate(result.body);
  }

  Future<FactModel> getFactYear(int year) async {
    final result = await http.Client().get(Uri.parse('https://numbersapi.com/$year/year'));

    if(result.statusCode != 200) {
      throw Exception('Error!');
    }

    return toModelYear(result.body);
  }
  
  FactModelNumber toModelNumber(final response) {
    final jsonDecoded = json.decode(response);
    print('ERROR 2224');

    return FactModelNumber(result: jsonDecoded["text"], isSuccess: jsonDecoded["found"]);
  }
  
  FactModelYear toModelYear(final response) {
    final jsonDecoded = json.decode(response);
    
    return FactModelYear(date: jsonDecoded["date"], result: jsonDecoded["text"], isSuccess: jsonDecoded["found"]);
  }
  
  FactModelDate toModelDate(final response) {
    final jsonDecoded = json.decode(response);

    return FactModelDate(year: jsonDecoded["year"],
        result: jsonDecoded["text"],
        isSuccess: jsonDecoded["found"]);
  }
}