// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordRequestModel _$ForgetPasswordRequestModelFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordRequestModel(
  email: json['email'] as String,
  purpose: json['purpose'] as String,
);

Map<String, dynamic> _$ForgetPasswordRequestModelToJson(
  ForgetPasswordRequestModel instance,
) => <String, dynamic>{'email': instance.email, 'purpose': instance.purpose};
