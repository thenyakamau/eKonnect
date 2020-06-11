import 'package:flutter/material.dart';

import 'presentation/pages/DashBoard.dart';
import 'presentation/pages/HotLine.dart';
import 'presentation/pages/Statistics.dart';
import 'presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: <Widget>[
            DashBoard(),
            HotLinePage(),
            StatisticsPage(),
          ],
        ),
      ),
    );
  }
}
