import 'package:ecommecerfrutas/src/pages/auth/views/LoginScreeam.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/app_name.dart';
import 'package:ecommecerfrutas/src/pages_route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScream extends StatelessWidget {
  const SplashScream({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Colors.green.shade100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppnameWidget(color: Colors.white),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
