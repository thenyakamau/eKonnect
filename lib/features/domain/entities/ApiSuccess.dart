import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ApiSuccess extends Equatable {
  final bool success;
  final String message;

  ApiSuccess({@required this.success, @required this.message}) : super();
  @override
  List<Object> get props => [success, message];
}
