import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../domain/entities/Countries.dart';
import '../../domain/entities/Interactions.dart';
import '../../domain/entities/UserProfile.dart';
import '../bloc/dashboarddata/dashboarddata_bloc.dart';
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
  List<Interaction> interaction;
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
    double height = MediaQuery.of(context).size.height;

    return BlocProvider<DashboarddataBloc>(
        create: (_) => bloc,
        child: BlocBuilder<DashboarddataBloc, DashboarddataState>(
          builder: (context, state) {
            if (state is DashboarddataInitial) {
              return buildSingleChildScrollView(context);
            } else if (state is DashboarddataLoadedState) {
              print("Loading");
              user = state.userProfile;
              world = state.world;
              kenya = state.kenya;
              interaction = state.interactions;
              return buildSingleChildScrollView(context);
            } else if (state is DashboarddataLoadingState) {
              return LoadingWidget(height: height);
            } else {
              return Container(color: Colors.white);
            }
          },
        ));
  }

  SingleChildScrollView buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: <Widget>[
          MyHeader(
            image: "assets/icons/Drcorona.svg",
            textTop: "All you need",
            textBottom: "is stay at home.",
            offset: offset,
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFE65100).withOpacity(1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  world != null ? world.cases.toString() : '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Confirmed Cases",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFE91E63).withOpacity(1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  world != null ? world.deaths.toString() : '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Total \n Deaths",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF228C22).withOpacity(1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  world != null
                                      ? world.recovered.toString()
                                      : '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Recovered Cases",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.purple,
                  width: double.infinity,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Kenya",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              kenya != null ? kenya.cases.toString() : '',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Confirmed ",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              kenya != null ? kenya.deaths.toString() : '',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Deaths",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              kenya != null ? kenya.recovered.toString() : '',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Recovered",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    user != null
                        ? user.gender == "Male"
                            ? "assets/images/male_1.png"
                            : "assets/images/female_1.png"
                        : 'assets/images/male_1.png',
                    fit: BoxFit.fill,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        user != null ? user.fname : '',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Text(user != null ? user.gender : ''),
                      SizedBox(height: 10),
                      Text(user != null ? user.phone : ''),
                      SizedBox(height: 10),
                      Text(user != null ? user.location : ''),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.topRight,
                        icon: Icon(Icons.edit, color: Colors.grey),
                        onPressed: () {
                          return Navigator.of(context).pushNamed("/login");
                        },
                      ),
                      SizedBox(height: 60)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Exposure",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "We have recorded " +
                      0.toString() +
                      " interactions between you and other people in the last 21 days. " +
                      0.toString() +
                      " of the people you've interacted with are COVID-19 positive patients." +
                      "\n\n Please note :\n An interaction is valid if both parties have installed this app. Share this app with your loved once.",
                  style: TextStyle(color: Colors.blue[200], fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
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
