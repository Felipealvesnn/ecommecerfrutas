import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UseModal {
  @JsonKey(name:'fullname')
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? token;
  String? id;

  UseModal({
     this.id,
     this.token,
     this.name,
     this.email,
     this.phone,
     this.cpf,
     this.password,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UseModal.fromJson(Map<String, dynamic> json) =>
      _$UseModalFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UseModalToJson(this);
}
