import 'package:ecommecerfrutas/src/pages/auth/LoginScreeam.dart';
import 'package:ecommecerfrutas/src/pages/splash/splash_screem.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home:SplashScream(),  //const LoginScreem(),
    );
  }
}
