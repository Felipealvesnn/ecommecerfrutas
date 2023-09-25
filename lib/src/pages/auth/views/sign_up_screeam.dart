import 'package:ecommecerfrutas/src/pages/auth/controller/auth_controller.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/custom_text_fiel.dart';
import 'package:ecommecerfrutas/src/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  final cpfFormatter = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final FoneFormatterd = MaskTextInputFormatter(
    mask: "(##)#####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  final _formkey = GlobalKey<FormState>();
  final authcontroller = Get.find<AuthController>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Cunstom_text_fild(
                                  onSaved: (p0) {
                                    authcontroller.user.name = p0;
                                  },
                                  Validator: nameValidator,
                                  textInputType: TextInputType.name,
                                  label: "Nome",
                                  icon: Icons.person,
                                ),
                                Cunstom_text_fild(
                                  onSaved: (p0) {
                                    authcontroller.user.email = p0;
                                  },
                                  Validator: emailValidator,
                                  textInputType: TextInputType.emailAddress,
                                  label: "Email",
                                  icon: Icons.email,
                                ),
                                Cunstom_text_fild(
                                  onSaved: (p0) {
                                    authcontroller.user.phone = p0;
                                  },
                                  Validator: phoneValidator,
                                  textInputType: TextInputType.phone,
                                  inputFormatters: [FoneFormatterd],
                                  label: "Celular",
                                  icon: Icons.phone,
                                ),
                                Cunstom_text_fild(
                                    onSaved: (p0) {
                                      authcontroller.user.cpf = p0;
                                    },
                                    Validator: cpfvalidator,
                                    textInputType: TextInputType.number,
                                    label: "Cpf",
                                    icon: Icons.credit_card,
                                    inputFormatters: [cpfFormatter]),
                                Cunstom_text_fild(
                                  onSaved: (p0) {
                                    authcontroller.user.password = p0;
                                  },
                                  label: "Senha",
                                  icon: Icons.lock,
                                  IsSecret: true,
                                ),
                                Cunstom_text_fild(
                                  onSaved: (p0) {
                                    authcontroller.user.password = p0;
                                  },
                                  label: "Confirmar Senha",
                                  icon: Icons.lock,
                                  IsSecret: true,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        _formkey.currentState!.save();
                                        authcontroller.signUP();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      "Cadastrar",
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
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
