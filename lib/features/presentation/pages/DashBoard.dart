import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../domain/entities/Countries.dart';
import '../../domain/entities/Interactions.dart';
import '../../domain/entities/UserProfile.dart';
import '../bloc/dashboarddata/dashboarddata_bloc.dart';
import '../widgets/dashboard_widgets/dashboard_widgets.dart';
import '../widgets/login_widgets/login_wigets.dart';
import '../widgets/widgets.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with AutomaticKeepAliveClientMixin {
  DashboarddataBloc bloc;
  UserProfile user;
  Countries world;
  Countries kenya;
  List<Interaction> interaction = [];
  final controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    bloc = sl<DashboarddataBloc>();
    bloc.add(GetDashBoardData());
    super.initState();
    controller.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboarddataBloc>(
      create: (_) => bloc,
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),
            BlocBuilder<DashboarddataBloc, DashboarddataState>(
              builder: (context, state) {
                if (state is DashboarddataInitial) {
                  return buildColumns(context);
                } else if (state is DashboarddataLoadedState) {
                  user = state.userProfile;
                  world = state.world;
                  kenya = state.kenya;
                  interaction = state.interactions;
                  return buildColumns(context);
                } else if (state is DashboarddataLoadingState) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ShimmerList(),
                  );
                } else if (state is DashboarddataErrorState) {
                  return Column(
                    children: <Widget>[
                      Center(
                        child: LoginButton(
                          press: () => bloc.add(GetDashBoardData()),
                          title: "Reload",
                        ),
                      ),
                      MyAlertDialog(
                        press: () => Navigator.of(context, rootNavigator: true)
                            .pop('dialog'),
                        message: state.message,
                        title: "Error",
                        buttonTitle: "Close",
                      ),
                    ],
                  );
                } else {
                  return Container(color: Colors.white);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Column buildColumns(BuildContext context) {
    return Column(
      children: <Widget>[
        WorldCases(world: world),
        KenyanCases(kenya: kenya),
        SizedBox(height: 10),
        UserProfileWidget(user: user),
        SizedBox(height: 10),
        InteractionsRecorded(interaction: interaction)
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
