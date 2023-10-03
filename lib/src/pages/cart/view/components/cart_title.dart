import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/Quantitywidget.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key, required this.remove, required this.cartItem});
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(widget.cartItem.item.itemName),
        subtitle:
            Text(UtilsServices.priceTocurrenci(widget.cartItem.totalPrive())),
        trailing: Quantitywidget(
          isRemovable: true,
          item: widget.cartItem.item.unit,
          quantity: widget.cartItem.quantity,
          onQuantityChange: (p0) => {
            setState(() {
              widget.cartItem.quantity = p0;
              if (p0 == 0) {
                widget.remove(widget.cartItem);
              }
            })
          },
        ),
      ),
    );
  }
}
