import 'dart:math';

import 'package:ecommecerfrutas/src/config/app_data.dart';
import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/pages/cart/components/cart_title.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/payment_dialog.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      cartItems.remove(cartItem);
      UtilsServices.showToast( "Item removido do carrinho");
    });
  }

  double cartTotalPrice() {
    double total = 0;
    cartItems.forEach((element) {
      total += element.item.price * element.quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showOrderDialog() {
      return showDialog<bool>(
        context: context,
        builder: (contexto) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text("Finalizar Compra"),
            content: Text("Deseja finalizar a compra?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("Cancelar"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Confirmar"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartTile(
                  remove: removeItemFromCart,
                  cartItem: cartItems[index],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 150,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    UtilsServices.priceTocurrenci(cartTotalPrice()),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        showOrderDialog().then((value) {
                          print(value);
                          if (value!) {
                            cartItems.clear();
                            //  Navigator.of(context).pushNamed(AppRoutes.checkout);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PaymentDialog(
                                  order: orders.first,
                                );
                              },
                            );
                          }else{
                            UtilsServices.showToast( "Compra cancelada");
                          }	
                        });
                      },
                      child: const Text(
                        "Finalizar Compra",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // color: Colors.red,
          ),
        ],
      ),
    );
  }
}
