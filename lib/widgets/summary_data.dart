import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/models/summary_model.dart';
import 'package:huyndcovidflutterchallenge/services/data_service.dart';
import 'package:huyndcovidflutterchallenge/widgets/summary_charts.dart';
import 'package:huyndcovidflutterchallenge/widgets/summary_stats.dart';
import 'package:huyndcovidflutterchallenge/widgets/world_record_title.dart';
import '../utils/constants.dart' as Constants;
import '../utils/styles.dart' as Styles;
class SummaryData extends StatefulWidget {
  final SummaryModel summaryModel;

  SummaryData(this.summaryModel);

  @override
  _SummaryDataState createState() => _SummaryDataState();
}

class _SummaryDataState extends State<SummaryData> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _controller,
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            )
            labelStyle: Styles,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: Text('Chart'),
              ),
              Tab(
                child: Text('Stats'),
              )
            ],
          ),
          Container(
            width: deviceSize.width,
            height: deviceSize.height *0.3,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                SummaryStats(widget.summaryModel),
                SummaryChart(widget.summaryModel),
              ],
            ),
          )
        ],
      )
    );
  }
}
