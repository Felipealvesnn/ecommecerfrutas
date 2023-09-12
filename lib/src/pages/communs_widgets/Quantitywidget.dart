import 'package:flutter/material.dart';

class Quantitywidget extends StatelessWidget {
  final String item;

  const Quantitywidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          _quatitiButtom(
            color: Colors.red,
            icon: Icons.remove,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "1, $item",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _quatitiButtom(
            color: Colors.green,
            icon: Icons.add,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _quatitiButtom extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _quatitiButtom(
      {super.key,
      required this.color,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(icon),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
