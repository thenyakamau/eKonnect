part of 'statisticsdata_bloc.dart';

abstract class StatisticsdataEvent extends Equatable {
  const StatisticsdataEvent();
}

class GetCountriesEvent extends StatisticsdataEvent {
  @override
  List<Object> get props => [];
}
