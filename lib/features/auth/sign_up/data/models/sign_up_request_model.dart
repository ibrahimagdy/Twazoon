import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String faculty;
  final String level;
  final int lastGrade;
  final String gender;
  final bool troubleSleeping;

  SignUpRequestModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.faculty,
    required this.level,
    required this.lastGrade,
    required this.gender,
    required this.troubleSleeping,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
