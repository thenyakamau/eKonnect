import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import 'presentation/bloc/homepagebloc/homepage_bloc.dart';
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
  HomepageBloc bloc;
  @override
  void initState() {
    bloc = sl<HomepageBloc>();
    bloc.add(TurnOnBluetoothEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomepageBloc>(
        create: (_) => bloc,
        child: BlocBuilder<HomepageBloc, HomepageState>(
          builder: (context, state) {
            if (state is HomepageInitial) {
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
            } else if (state is BlueToothOnErrorState) {
              return BlueToothOffWidget(
                press: () => bloc.add(TurnOnBluetoothEvent()),
              );
            } else {
              return MyAlertDialog(
                press: () {
                  return Navigator.of(context).pushReplacementNamed('/');
                },
                message: "Soethings Wrong",
                title: "Uknown Error",
                buttonTitle: "Retry",
              );
            }
          },
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
