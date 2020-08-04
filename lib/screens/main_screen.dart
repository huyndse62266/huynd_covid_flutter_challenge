import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/services/data_service.dart';
import 'package:huyndcovidflutterchallenge/widgets/countries_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: DataService.getDataFromApi(),
          builder: (context, dataSnapshot){
            if(dataSnapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: CountriesData(dataSnapshot.data['countries']),
            );
          },
        ),
      ),
    );
  }
}
