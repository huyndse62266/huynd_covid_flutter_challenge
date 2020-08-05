import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/services/data_service.dart';
import 'package:huyndcovidflutterchallenge/widgets/countries_data.dart';
import 'package:huyndcovidflutterchallenge/widgets/summary_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
//      backgroundColor: Colors.white54,
      body: SafeArea(
        child: FutureBuilder(
          future: DataService.getDataFromApi(),
          builder: (context, dataSnapshot){
            if(dataSnapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              width: deviceSize.width,
              height: deviceSize.height,
              child: SingleChildScrollView(
                child: CountriesData(dataSnapshot.data['countries']),
              ),
            );
//            return Container(
//              width: deviceSize.width,
//              height: deviceSize.height,
//              child: SummaryData(dataSnapshot.data['summary']),
//            );
          },
        ),
      ),
    );
//        child: Container(
//          width: deviceSize.width,
//          height: deviceSize.height,
//          child: SingleChildScrollView(
//            child: CountriesData(null),
//          ),
//        ),
//      )
//    );
  }
}
