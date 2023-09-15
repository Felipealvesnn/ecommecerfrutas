import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:ecommecerfrutas/src/pages/product/prodct_screaam.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class item_title extends StatelessWidget {
  final ItemModel item;
  final void Function(GlobalKey) runAddToCardAnimation;
  final GlobalKey imageKey = GlobalKey();

   item_title({super.key, required this.item, required this.runAddToCardAnimation});

  @override
  Widget build(BuildContext context) {
    String moeda = UtilsServices.priceTocurrenci(item.price);
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScream(
                  item: item,
                ),
              ),
            );
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //imagem
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Container(
                        key: imageKey,
                        child: Image.asset(
                          item.imgUrl,
                        ),
                      ),
                    ),
                  ),
                  //titulo
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //preço
                  Row(
                    children: [
                      Text(
                        moeda,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "/${item.unit}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              runAddToCardAnimation(imageKey);
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Theme.of(context).colorScheme.secondary,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
