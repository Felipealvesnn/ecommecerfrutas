import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:flutter/material.dart';

class item_title extends StatelessWidget {
  final ItemModel item;

  const item_title({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey[300],
      

    );
  }
}