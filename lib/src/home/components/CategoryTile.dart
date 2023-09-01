import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String Category;
  final bool isSelect;

  const CategoryTile({
    super.key,
    required this.Category,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: isSelect
            ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        Category,
        style: TextStyle(
          color: isSelect
              ? Colors.black
              : Theme.of(context).colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
