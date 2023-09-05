import 'package:ecommecerfrutas/src/pages/auth/components/custom_text_fiel.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key, Key? key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final FoneFormatterd = MaskTextInputFormatter(
    mask: "(##)#####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

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
                Column(
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
                              const Cunstom_text_fild(
                                label: "Nome",
                                icon: Icons.person,
                              ),
                              const Cunstom_text_fild(
                                label: "Email",
                                icon: Icons.email,
                              ),
                               Cunstom_text_fild(
                                inputFormatters: [FoneFormatterd],
                                label: "Celular",
                                icon: Icons.phone,
                              ),
                               Cunstom_text_fild(
                                label: "Cpf",
                                icon: Icons.credit_card,
                                inputFormatters:[cpfFormatter] 
                                  
                                
                              ),
                              const Cunstom_text_fild(
                                label: "Senha",
                                icon: Icons.lock,
                                IsSecret: true,
                              ),
                              const Cunstom_text_fild(
                                label: "Confirmar Senha",
                                icon: Icons.lock,
                                IsSecret: true,
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
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
