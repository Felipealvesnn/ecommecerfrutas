import 'package:flutter/material.dart';

class Quantitywidget extends StatelessWidget {
  final String item;
  final int quantity;
  final Function(int) onQuantityChange;
  final bool isRemovable;

  const Quantitywidget({
    super.key,
    required this.item,
    required this.onQuantityChange,
    required this.quantity,
    this.isRemovable = false,
  });

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
        mainAxisSize: MainAxisSize.min,
        children: [
          _quatitiButtom(
            color: !isRemovable || quantity > 1 ? Colors.grey : Colors.red,
            icon: !isRemovable || quantity > 1
                ? Icons.remove
                : Icons.delete_forever,
            onPressed: () {
              if (quantity == 1 && !isRemovable) return;
              onQuantityChange(quantity - 1);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "$quantity, $item",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _quatitiButtom(
            color: Colors.green,
            icon: Icons.add,
            onPressed: () {
              onQuantityChange(quantity + 1);
            },
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
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        highlightColor: Colors.transparent,
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () {
              onPressed();
            },
            icon: Icon(icon),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
