import 'dart:ffi';

import 'package:ecommecerfrutas/src/constants/store_keys.dart';
import 'package:ecommecerfrutas/src/models/user_model.dart';
import 'package:ecommecerfrutas/src/pages/auth/repository/auth_repository.dart';
import 'package:ecommecerfrutas/src/pages/auth/result/auth_result.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;
  UseModal user = UseModal();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    validateToken();
  }

  void Savetoken() async {
    // salvar
    UtilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    Get.offAllNamed(PagesRoutes.Base);
  }

  Future<void> validateToken() async {
    String? token = await UtilsServices.readLocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offAllNamed(PagesRoutes.signUpRoute);
      return;
    } else {
      final AuthResult auth = await AuthRepository.validateToken(token!);

      auth.when(
        success: (user) {
          this.user = user;
          Savetoken();
        },
        error: (String error) {
          // UtilsServices.showToast(error, errork: true);
          // Get.snackbar(
          //   'Error',
          //   error,
          //   backgroundColor: Colors.red,
          //   colorText: Colors.white,
          // );
          signOut();
        },
      );
    }
  }

  Future<void> signOut() async {
    // zerar o user
    user = UseModal();

    //remover o token localmente
    UtilsServices.removeLocalData(key: StorageKeys.token);

    //ir para login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> signIN({required String email, required String password}) async {
    isLogin.value = true;
    final AuthResult result = await AuthRepository.signIn(
      email: email,
      password: password,
    );
    isLogin.value = false;
    Get.offAllNamed(PagesRoutes.Base);

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PagesRoutes.Base);
      },
      error: (String error) {
        UtilsServices.showToast(error, errork: true);
        Get.snackbar(
          'Error',
          error,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
    );
  }

  Future<Void> ValitadeToken() async {
    isLogin.value = true;
    final AuthResult result = await AuthRepository.validateToken(user.token!);
    isLogin.value = false;
    result.when(
      success: (user) {
        this.user = user;

        Savetoken();
      },
      error: (String error) {
        UtilsServices.showToast(error, errork: true);
        Get.snackbar(
          'Error',
          error,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
    );
    return Future.value();
  }
}
