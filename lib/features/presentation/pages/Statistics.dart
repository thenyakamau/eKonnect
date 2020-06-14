import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/statisticsdata/statisticsdata_bloc.dart';
import '../widgets/loading_widget.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  StatisticsdataBloc bloc;

  @override
  void initState() {
    bloc = sl<StatisticsdataBloc>();
    bloc.add(GetCountriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return BlocProvider<StatisticsdataBloc>(
      create: (_) => bloc,
      child: BlocBuilder<StatisticsdataBloc, StatisticsdataState>(
        builder: (context, state) {
          if (state is StatisticsdataInitial) {
            return Container();
          } else if (state is StatisticsdataLoadingState) {
            return Center(child: LoadingWidget(height: height));
          } else if (state is StatisticsdataLoadedState) {
            List posts = state.response.body;
            return _buildPost(context, posts);
          } else if (state is StatisticsdataErrorState) {
            return Center(child: Text(state.message));
          } else {
            return null;
          }
        },
      ),
    );
  }

  ListView _buildPost(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Container(
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
                      posts[index]['country'],
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
                              posts[index]['cases'].toString(),
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
                              posts[index]['deaths'].toString(),
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
                              posts[index]['recovered'].toString(),
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
        );
      },
    );
  }
}
