import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/models/summary_model.dart';
import 'package:huyndcovidflutterchallenge/widgets/chart_record.dart';
import 'package:huyndcovidflutterchallenge/widgets/world_record_title.dart';

class SummaryData extends StatelessWidget {
  final SummaryModel summaryModel;

  SummaryData(this.summaryModel);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: 200,
      child: Column(
        children: <Widget>[
          ChartRecord(summaryModel),
          Row(
            children: <Widget>[
              Expanded(
                child: WorldRecordTitle('Total case', summaryModel.totalConfirmed, summaryModel.newConfirmed),
              ),
              Expanded(
                child: WorldRecordTitle('Recovered', summaryModel.totalRecovered, summaryModel.newRecovered),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: WorldRecordTitle('Deaths', summaryModel.totalDeaths, summaryModel.newDeaths),
              ),
              Expanded(
                child: WorldRecordTitle('Active', summaryModel.totalConfirmed - summaryModel.totalRecovered - summaryModel.totalDeaths, null),
              ),
            ],
          )
        ],
      )
    );
  }
}
