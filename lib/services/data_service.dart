import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:huyndcovidflutterchallenge/models/country_model.dart';
import 'package:huyndcovidflutterchallenge/models/summary_model.dart';
import '../utils/constants.dart' as Constants;
class DataService{

  static Future<SummaryModel> getSummaryData()async{
    try{
      final response = await http.get(Constants.SUMMARY_API);
      print(response.statusCode);
      if(response.statusCode == 200){
        final extractData = jsonDecode(response.body);
        final summaryModel = SummaryModel.fromJson(extractData['results'][0]);
        print(summaryModel.toString());
        return summaryModel;
      }
    }catch(error){
      print(error);
      throw error;
    }
    return null;
  }

  static Future<Map<String, dynamic>> getDataFromApi()async{
    try{
      final response = await http.get(Constants.COUNTRIES_API);
      if(response.statusCode == 200){
        final extractData = jsonDecode(response.body);
        final summaryModel = SummaryModel.fromJson(extractData['globalData']);
        List<CountryModel> countries = [];
        extractData['countries'].forEach((country){
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
      print(error);
      throw error;
    }
    return null;
  }
}