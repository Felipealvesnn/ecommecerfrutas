import 'package:ecommecerfrutas/src/config/app_data.dart';
import 'package:ecommecerfrutas/src/pages/auth/controller/auth_controller.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/custom_text_fiel.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Profile_tab extends StatefulWidget {
  const Profile_tab({super.key});

  @override
  State<Profile_tab> createState() => _Profile_tabState();
}

class _Profile_tabState extends State<Profile_tab> {
  final authcontrolerr = Get.find<AuthController>();
  
  @override
  Widget build(BuildContext context) {
    Future<bool?> updaTePassoword() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Editar Passoword",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Cunstom_text_fild(
                        label: "Passoword",
                        icon: Icons.lock,
                        IsSecret: true,
                        inicialValue: Userprograma.password,
                      ),
                      const Cunstom_text_fild(
                        label: "New Passoword",
                        icon: Icons.lock_outline,
                        IsSecret: true,
                        // inicialValue: Userprograma.password,
                      ),
                      const Cunstom_text_fild(
                        label: "Confirm New Passoword",
                        icon: Icons.lock_outline,
                        IsSecret: true,
                        //  inicialValue: Userprograma.password,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text("Editar"),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                     authcontrolerr.signOut();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: [
          IconButton(
            onPressed: () {
                Get.offNamed(PagesRoutes.signUpRoute);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 32, 16, 16),
        children: [
          Cunstom_text_fild(
            label: "Email",
            icon: Icons.email,
            inicialValue: Userprograma.email,
            readOnly: true,
          ),
          Cunstom_text_fild(
            label: "Nome",
            icon: Icons.person,
            inicialValue: Userprograma.name,
            readOnly: true,
          ),
          Cunstom_text_fild(
            label: "Celular",
            icon: Icons.phone,
            inicialValue: Userprograma.phone,
            readOnly: true,
          ),
          Cunstom_text_fild(
            label: "Cpf",
            icon: Icons.numbers,
            IsSecret: true,
            inicialValue: Userprograma.cpf,
            readOnly: true,
          ),
          Cunstom_text_fild(
            label: "Passoword",
            icon: Icons.location_on,
            IsSecret: true,
            inicialValue: Userprograma.password,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                updaTePassoword();
              },
              child: Text("Editar"),
            ),
          ),
        ],
      ),
    );
  }
}
