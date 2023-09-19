import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/models/order_model.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/payment_dialog.dart';
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
        initiallyExpanded: order.status == 'pending_payment',
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
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
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 150,
                    child: ListView(
                      children: order.items.map((e) {
                        return _orderItem(e: e);
                      }).toList(),
                    ),
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
          ),

          //total
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.grey,
              ),
              children: [
                const TextSpan(
                    text: 'Total  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                TextSpan(
                  text: 'R\$ ${UtilsServices.priceTocurrenci(order.total)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          //botao pagamento
          Visibility(
            visible: order.status == 'pending_payment',
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return PaymentDialog(
                      order: order,
                    );
                  },
                );
              },
              icon: Icon(Icons.qr_code),
              /* Image.asset(
                'assets/app_images/pix.png',
                height: 18,
              ), */
              label: const Text('Ver qrcode do Pix'),
            ),
          ),
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
