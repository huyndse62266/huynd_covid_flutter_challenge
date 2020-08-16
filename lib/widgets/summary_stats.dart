import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/models/summary_model.dart';
import 'package:huyndcovidflutterchallenge/widgets/world_record_title.dart';
import '../utils/constants.dart' as Constants;

class SummaryStats extends StatelessWidget {
  final SummaryModel summaryModel;

  SummaryStats(this.summaryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: WorldRecordTitle(title:'Total case', totalRecord: summaryModel.totalConfirmed, color: Color(Constants.TOTAL_COLOR),),
              ),
              Expanded(
                child: WorldRecordTitle(title:'Recovered', totalRecord: summaryModel.totalRecovered, color: Color(Constants.RECOVERED_COLOR),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: WorldRecordTitle(title:'Deaths', totalRecord: summaryModel.totalDeaths, color: Color(Constants.DEATH_COLOR),),
              ),
              Expanded(
                child: WorldRecordTitle(title:'Active', totalRecord: summaryModel.totalActive, color: Color(Constants.ACTIVE_COLOR),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
