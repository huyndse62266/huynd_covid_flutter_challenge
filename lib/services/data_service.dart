import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:huyndcovidflutterchallenge/models/country_model.dart';
import 'package:huyndcovidflutterchallenge/models/summary_model.dart';
class DataService{

  static Future<Map<String, dynamic>> getDataFromApi()async{
    try{
      final response = await http.get('https://api.covid19api.com/summary');
      if(response.statusCode == 200){
        final extractData = jsonDecode(response.body);
        final summaryModel = SummaryModel.fromJson(extractData['Global']);
        List<CountryModel> countries = [];
        extractData['Countries'].forEach((country){
          countries.add(new CountryModel.fromJson(country));
        });
        countries.sort((first,second)=> first.totalConfirmed.compareTo(second.totalConfirmed));
        countries = countries.reversed.toList();
        Map<String, dynamic> result = {};
        result.putIfAbsent("summary", () => summaryModel);
        result.putIfAbsent("countries", () => countries);
        return result;
      }
    }catch(error){
      throw error;
    }
    return null;
  }
}