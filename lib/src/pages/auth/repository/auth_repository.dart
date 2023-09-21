import 'dart:math';

import 'package:ecommecerfrutas/src/constants/endsPotins.dart';
import 'package:ecommecerfrutas/src/services/http_manager.dart';

class AuthRepository {

 static
  Future signIn({required String email, required String password}) async {
    final result = await HttpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'username': email,
        'password': password,
      },
    );
    if (result['result'] != null) {
       print('funcionou');
    }else{
       print('nao funcionou');
    }

    return result;
  }
}
