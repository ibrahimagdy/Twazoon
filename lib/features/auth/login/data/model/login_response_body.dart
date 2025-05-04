import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final String model;

  LoginResponseBody({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

