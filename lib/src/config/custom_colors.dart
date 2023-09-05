import 'package:flutter/material.dart';

Map<int, Color> _swatOchopaticy = {
  50: const Color.fromARGB(1, 139, 195, 74),
  100: const Color.fromARGB(1, 139, 195, 74),
  200: const Color.fromARGB(1, 139, 195, 74),
};

abstract class CustomColors {
  static Color customContranstcolor = Colors.red.shade700;
  static MaterialColor customSwatchcolor = MaterialColor(
    0xff8bc34a, _swatOchopaticy
  );
}
