// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      faculty: json['faculty'] as String,
      level: json['level'] as String,
      lastGrade: (json['lastGrade'] as num).toInt(),
      gender: json['gender'] as String,
      troubleSleeping: json['troubleSleeping'] as bool,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'faculty': instance.faculty,
      'level': instance.level,
      'lastGrade': instance.lastGrade,
      'gender': instance.gender,
      'troubleSleeping': instance.troubleSleeping,
    };
