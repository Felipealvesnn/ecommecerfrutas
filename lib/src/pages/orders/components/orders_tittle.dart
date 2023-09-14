import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/models/order_model.dart';
import 'package:ecommecerfrutas/src/pages/orders/components/order_status.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
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
        childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
              'data: ${UtilsServices.formatDateTime(order.createDatetime)}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: order.items.map((e) {
                      return _orderItem(e: e);
                    }).toList(),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Expanded(
                  flex: 2,
                  child: OrderStatuss(
                      status: order.status,
                      isOverdul: order.overdueDatetime.isBefore(
                        DateTime.now(),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _orderItem extends StatelessWidget {
  const _orderItem({
    super.key,
    required this.e,
  });
  final CartItemModel e;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${e.quantity} ${e.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Text(
              ' ${e.item.itemName}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            ' R\$ ${UtilsServices.priceTocurrenci(e.totalPrive())}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
