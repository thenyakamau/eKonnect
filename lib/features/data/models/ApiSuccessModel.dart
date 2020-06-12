import 'package:meta/meta.dart';

import '../../domain/entities/ApiSuccess.dart';

class ApiSuccessModel extends ApiSuccess {
  final bool success;
  final String message;

  ApiSuccessModel({
    @required this.success,
    @required this.message,
  }) : super(message: message, success: success);

  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) {
    // success = json['success'];
    // message = json['message'];
    return ApiSuccessModel(success: json['success'], message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
