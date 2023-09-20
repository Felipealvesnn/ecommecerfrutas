import 'package:ecommecerfrutas/src/pages/auth/LoginScreeam.dart';
import 'package:ecommecerfrutas/src/pages/auth/sign_up_screeam.dart';
import 'package:ecommecerfrutas/src/pages/base/base_screen.dart';
import 'package:ecommecerfrutas/src/pages/splash/splash_screem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: '/Splash',
      page: () => const SplashScream(),
    ),
    GetPage(
      name: '/SignUp',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/Login',
      page: () => const LoginScreem(),
    ),
    GetPage(
      name: '/',
      page: () =>  const BaseScreem(),
    ),
  ];
}


abstract class PagesRoutes{

  static const String signInRoute = '/SignUp';
  static const String Base = '/';

  static const String signUpRoute = '/Login';
  static const String splashRoute = '/Splash';
  
}
