import 'package:flutter/material.dart';

import 'presentation/pages/DashBoard.dart';
import 'presentation/pages/HotLine.dart';
import 'presentation/pages/Statistics.dart';
import 'presentation/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: <Widget>[
            DashBoard(),
            StatisticsPage(),
            HotLinePage(),
          ],
        ),
      ),
    );
  }
}
