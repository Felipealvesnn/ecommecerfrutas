import 'package:ecommecerfrutas/src/config/app_data.dart';
import 'package:ecommecerfrutas/src/pages/orders/components/orders_tittle.dart';
import 'package:flutter/material.dart';

class Orders_tab extends StatelessWidget {
  const Orders_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.separated(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrdersTitle(order: orders[index]);
        },
        padding: EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
