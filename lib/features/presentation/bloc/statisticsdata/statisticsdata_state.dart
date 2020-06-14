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
  final Response response;

  StatisticsdataLoadedState({@required this.response});

  @override
  List<Object> get props => [response];
}

class StatisticsdataErrorState extends StatisticsdataState {
  final String message;

  StatisticsdataErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
