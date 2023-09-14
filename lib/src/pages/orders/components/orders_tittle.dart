import 'package:ecommecerfrutas/src/models/order_model.dart';
import 'package:flutter/material.dart';

class OrdersTitle extends StatelessWidget {
  const OrdersTitle({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(16.0),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido:  ${order.id}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'data: ${order.createDatetime.toString().substring(0, 10)}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        children: [
         const Text(
            'Produtos',
            style:  TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            children: order.items.map((item) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  item.item.imgUrl,
                  fit: BoxFit.cover,
                  height: 50.0,
                  width: 50.0,
                ),
                title: Text(item.item.itemName),
                subtitle: Text('${item.quantity}x'),
                trailing: Text(
                  'R\$ ${item.item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                    fontSize: 14.0,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'R\$ ${order.total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
