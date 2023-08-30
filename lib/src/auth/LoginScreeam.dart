import 'package:flutter/material.dart';

class LoginScreem extends StatelessWidget {
  const LoginScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(

              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}
