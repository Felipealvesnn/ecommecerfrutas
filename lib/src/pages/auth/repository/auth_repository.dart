import 'dart:ffi';
import 'dart:math';

import 'package:ecommecerfrutas/src/constants/endsPotins.dart';
import 'package:ecommecerfrutas/src/models/user_model.dart';
import 'package:ecommecerfrutas/src/pages/auth/repository/auth_errors.dart';
import 'package:ecommecerfrutas/src/pages/auth/result/auth_result.dart';
import 'package:ecommecerfrutas/src/services/http_manager.dart';

class AuthRepository {
  static AuthResult sucesoouerror(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      return AuthResult.success(result['result']);
    } else {
      return AuthResult.error(AutherrosStrings(result['error']));
    }
  }

  static Future<AuthResult> validateToken(String token) async {
    final result = await HttpManager.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.get,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );
    if (result['result'] != null) {
      final user = UseModal.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(AutherrosStrings(result['error']));
    }
  }

  static Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await HttpManagers.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'username': email,
        'password': password,
      },
    );
    return sucesoouerror(result);
  }

  static Future<AuthResult> signUp(UseModal user) async {
    final result = await HttpManager.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );
    return sucesoouerror(result);
  }

  static Future<void> resetePassoword(String email) async {
    await HttpManager.restRequest(
      url: Endpoints.resetPassword,
      method: HttpMethods.post,
      body: {
        'email': email,
      },
    );
    //return sucesoouerror(result);
  }
}
