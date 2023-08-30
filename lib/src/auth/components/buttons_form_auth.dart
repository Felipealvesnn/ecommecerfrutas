import 'package:flutter/material.dart';

class Buttons_text_form extends StatelessWidget {
  const Buttons_text_form({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
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
                   )
      ],
    );
  }
}