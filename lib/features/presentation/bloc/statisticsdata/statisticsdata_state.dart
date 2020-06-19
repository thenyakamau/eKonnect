part of 'statisticsdata_bloc.dart';

abstract class StatisticsdataState extends Equatable {
  const StatisticsdataState();
}

class StatisticsdataInitial extends StatisticsdataState {
  @override
  List<Object> get props => [];
}

class StatisticsdataLoadingState extends StatisticsdataState {
  @override
  List<Object> get props => [];
}

class StatisticsdataLoadedState extends StatisticsdataState {
  final List<Countries> countries;

  StatisticsdataLoadedState({@required this.countries});

  @override
  List<Object> get props => [countries];
}

class StatisticsdataErrorState extends StatisticsdataState {
  final String message;
  final List<Countries> countries;

  StatisticsdataErrorState({@required this.message, @required this.countries});
  @override
  List<Object> get props => [message];
}

class StatisticsdataCacheErrorState extends StatisticsdataState {
  final String message;

  StatisticsdataCacheErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
