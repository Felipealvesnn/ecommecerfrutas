import 'package:ecommecerfrutas/src/models/user_model.dart';
import 'package:ecommecerfrutas/src/pages/auth/repository/auth_repository.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;
  Future<void> signIN({required String email, required String password}) async {
    final result = await AuthRepository.signIn(
      email: email,
      password: password,
    );
    if (result['result'] != null) {
      final user = UseModal.fromJson(result['result']);
      Get.offAllNamed(PagesRoutes.Base);
    } else {
      Get.snackbar(
        'Erro',
        'Usuário ou senha inválidos',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
