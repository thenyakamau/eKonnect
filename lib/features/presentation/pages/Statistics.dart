import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../data/models/CountriesModel.dart';
import '../bloc/statisticsdata/statisticsdata_bloc.dart';
import '../widgets/dashboard_widgets/dashboard_widgets.dart';
import '../widgets/widgets.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with AutomaticKeepAliveClientMixin {
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
            return ShimmerList();
          } else if (state is StatisticsdataLoadedState) {
            return _buildPost(context, state.countries);
          } else if (state is StatisticsdataErrorState) {
            return _buildPost(context, state.countries);
          } else if (state is StatisticsdataCacheErrorState) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ListView _buildPost(BuildContext context, List<CountriesModel> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return KenyanCases(kenya: countries[index]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
