import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String? message;
  final String? model;

  SignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    this.message,
    this.model,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
