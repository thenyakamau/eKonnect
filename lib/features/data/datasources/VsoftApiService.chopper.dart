// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VsoftApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$VsoftApiService extends VsoftApiService {
  _$VsoftApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = VsoftApiService;

  @override
  Future<Response<dynamic>> loginUser(Map<String, dynamic> body) {
    final $url = '/index.php/api/users';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> logContact(Map<String, dynamic> body) {
    final $url = '/index.php/api/contact';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
