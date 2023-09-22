// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UseModal _$UseModalFromJson(Map<String, dynamic> json) => UseModal(
      id: json['id'] as String,
      token: json['token'] as String,
      name: json['fullname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      cpf: json['cpf'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UseModalToJson(UseModal instance) => <String, dynamic>{
      'fullname': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'cpf': instance.cpf,
      'password': instance.password,
      'token': instance.token,
      'id': instance.id,
    };
