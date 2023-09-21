class UseModal {
  String name;
  String email;
  String phone;
  String cpf;
  String password;
  String token;
  String id;

  UseModal({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.password,
  });

  factory UseModal.fromJson(Map<String, dynamic> json) {
    return UseModal(
      id: json['_id'],
      token: json['token'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      cpf: json['cpf'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'token': token,
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
    };
  }


}
