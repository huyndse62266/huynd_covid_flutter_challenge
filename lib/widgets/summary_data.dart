import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import '../models/summary_model.dart';
import '../widgets/summary_charts.dart';
import '../widgets/summary_stats.dart';

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
          Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(25)
            ),
            child: TabBar(
              controller: _controller,
              indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white,
              ),
              labelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  child: Text('Stats'),
                ),
                Tab(
                  child: Text('Chart'),
                ),
              ],
            ),
          ),
          Container(
            width: deviceSize.width,
            height: deviceSize.height *0.35,
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
