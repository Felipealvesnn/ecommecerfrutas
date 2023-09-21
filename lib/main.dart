import 'package:ecommecerfrutas/src/pages/auth/views/LoginScreeam.dart';
import 'package:ecommecerfrutas/src/pages/auth/controller/auth_controller.dart';
import 'package:ecommecerfrutas/src/pages/splash/splash_screem.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  Get.lazyPut(() => AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'Lojinha de frutas',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Defina a cor de fundo do Scaffold como branco.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          // Defina a cor primária como verde.
          accentColor: const Color.fromARGB(196, 250, 249, 249),
          backgroundColor: const Color.fromARGB(196, 250, 249, 249),
        ),
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
      //const LoginScreem(),
    );
  }
}
