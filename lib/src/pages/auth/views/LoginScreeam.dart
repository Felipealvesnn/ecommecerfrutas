import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommecerfrutas/src/pages/auth/controller/auth_controller.dart';
import 'package:ecommecerfrutas/src/pages/auth/views/sign_up_screeam.dart';
import 'package:ecommecerfrutas/src/pages/base/base_screen.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/app_name.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../communs_widgets/custom_text_fiel.dart';

class LoginScreem extends StatelessWidget {
  LoginScreem({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    const AppnameWidget(color: Colors.white, fontSize: 40),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Cunstom_text_fild(
                        controller: emailController,
                        icon: Icons.email,
                        label: "Email",
                        Validator: (String? email) {
                          if (email == null || email.isEmpty) {
                            return "Email não pode ser vazio";
                          }
                          if (!email.isEmail) return "Email invalido";

                          return null; // O e-mail é válido
                        },
                      ),
                      Cunstom_text_fild(
                        controller: passwordController,
                        IsSecret: true,
                        icon: Icons.lock,
                        label: "Password",
                        Validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return "Senha não pode ser vazio";
                          }
                          if (senha.length < 6) {
                            return "Senha deve ter pelo menos 6 caracteres";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          //  init: AuthController(),
                          // initState: (_) {},
                          builder: (authcontroller) {
                            return ElevatedButton(
                              onPressed: authcontroller.isLogin.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        authcontroller.signIN(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                      // Get.offNamed(PagesRoutes.Base);
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: authcontroller.isLogin.value
                                  ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            );
                          },
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
