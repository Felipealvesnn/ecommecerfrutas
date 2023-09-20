import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommecerfrutas/src/pages/auth/sign_up_screeam.dart';
import 'package:ecommecerfrutas/src/pages/base/base_screen.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/app_name.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../communs_widgets/custom_text_fiel.dart';

class LoginScreem extends StatelessWidget {
  const LoginScreem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: size.size.height,
          width: size.size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //nome do app
                    AppnameWidget(color: Colors.white, fontSize: 40),
                    //categorias
                    SizedBox(
                      height: 40,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: const Duration(milliseconds: 500),
                          animatedTexts: [
                            FadeAnimatedText(
                              "Frutas",
                            ),
                            FadeAnimatedText(
                              "Legumes",
                            ),
                            FadeAnimatedText(
                              "Verduras",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //formulario
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Cunstom_text_fild(
                      icon: Icons.email,
                      label: "Email",
                    ),
                    const Cunstom_text_fild(
                      IsSecret: true,
                      icon: Icons.lock,
                      label: "Password",
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offNamed(PagesRoutes.Base);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //botao esqueceu password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    ///divisor
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 17,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.grey.withAlpha(90),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //botao de novo usuario
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => SignUpScreen(),
                          //   ),
                          // );
                          Get.toNamed(PagesRoutes.signInRoute);
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          "Criar Nova Conta",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
