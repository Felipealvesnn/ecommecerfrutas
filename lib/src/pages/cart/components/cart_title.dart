import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/Quantitywidget.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cartItem});
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(
          cartItem.item.imgUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(cartItem.item.itemName),
        subtitle: Text(UtilsServices.priceTocurrenci(cartItem.totalPrive())),
        trailing: Quantitywidget(
          isRemovable: true,
          item: cartItem.item.unit,
          quantity: cartItem.quantity,
          onQuantityChange: (p0) => {},
        ),
      ),
    );
  }
}
