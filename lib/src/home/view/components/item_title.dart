import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:ecommecerfrutas/src/pages/product/prodct_screaam.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class item_title extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) runAddToCardAnimation;

  const item_title(
      {super.key, required this.item, required this.runAddToCardAnimation});

  @override
  State<item_title> createState() => _item_titleState();
}

class _item_titleState extends State<item_title> {
  final GlobalKey imageKey = GlobalKey();

  IconData titleicon = Icons.add_shopping_cart_outlined;
  Future<void> switcheIcon() async {
    setState(() => titleicon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() => titleicon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    String moeda = UtilsServices.priceTocurrenci(widget.item.price);
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScream(
                  item: widget.item,
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
                      tag: widget.item.imgUrl,
                      child: Container(
                        key: imageKey,
                        child: Image.asset(
                          widget.item.imgUrl,
                        ),
                      ),
                    ),
                  ),
                  //titulo
                  Text(
                    widget.item.itemName,
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
                        "/${widget.item.unit}",
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
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switcheIcon();
                  widget.runAddToCardAnimation(imageKey);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Icon(
                    titleicon,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
