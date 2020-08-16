import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/services/data_service.dart';
import 'package:huyndcovidflutterchallenge/widgets/countries_data.dart';
import 'package:huyndcovidflutterchallenge/widgets/header.dart';
import 'package:huyndcovidflutterchallenge/widgets/summary_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    print(deviceSize.height);
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: SafeArea(
//        child: FutureBuilder(
//          future: DataService.getDataFromApi(),
//          builder: (context, dataSnapshot){
//            if(dataSnapshot.connectionState == ConnectionState.waiting){
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
//            return Container(
//              width: deviceSize.width,
//              height: deviceSize.height,
//              padding: EdgeInsets.symmetric(horizontal: 10),
//              child: SingleChildScrollView(
//                child: Column(
//                  children: <Widget>[
//                    SummaryData(dataSnapshot.data['summary']),
//                    CountriesData(dataSnapshot.data['countries'])
//                  ],
//                ),
//              ),
//            );
////            return Container(
////              width: deviceSize.width,
////              height: deviceSize.height,
////              child: SummaryData(dataSnapshot.data['summary']),
////            );
//          },
//        ),
//      ),
//    );
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                flexibleSpace: Header(),
                floating: true,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: deviceSize.height * 0.3,
                backgroundColor: Colors.white,
              )
            ];
          },
          body: FutureBuilder(
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SummaryData(dataSnapshot.data['summary']),
                      CountriesData(dataSnapshot.data['countries'])
                    ],
                  ),
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
      )

    );
  }
}
