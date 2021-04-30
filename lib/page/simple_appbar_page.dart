import 'package:covidmobile/main.dart';
import 'package:flutter/material.dart';
import 'package:covidmobile/page/covidinfo.dart';
import 'package:covidmobile/page/dailycases.dart';
import 'package:covidmobile/page/statuscases.dart';
import 'package:covidmobile/page/forecasting.dart';
import 'package:covidmobile/page/cluster.dart';

class SimpleAppBarPage extends StatefulWidget {
  @override
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<SimpleAppBarPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              MyApp.title,
              style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffcc2b5e), Color(0xff753a88)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(icon: Icon(Icons.bar_chart_outlined), text: 'Cases'),
                Tab(icon: Icon(Icons.insights_sharp), text: 'Analyzer'),
                Tab(icon: Icon(Icons.today_rounded), text: 'Status'),
                Tab(icon: Icon(Icons.info_outline_rounded), text: 'Info'),
                Tab(icon: Icon(Icons.people_outlined), text: 'Cluster'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              DailyCases(), //Daily cases section
              Forecasting(), //Analyzer section
              StatusCases(), //Status of cases section
              MyHomePage(), //Infographic section
              Clusters(), //Clusters section
            ],
          ),
        ),
      );
}
