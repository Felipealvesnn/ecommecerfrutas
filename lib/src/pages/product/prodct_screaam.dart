import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/Quantitywidget.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class ProductScream extends StatelessWidget {
  final ItemModel item;

  const ProductScream({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String moeda = UtilsServices.priceTocurrenci(item.price);
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //conteudo
          Column(
            children: [
              Expanded(
                child: Hero(tag: item.imgUrl, child: Image.asset(item.imgUrl)),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 20,
                          offset: Offset(0, -10),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        //titulo
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            item.itemName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //preço
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                moeda,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Quantitywidget(
                                item: item.unit,
                              ),
                            ],
                          ),
                        ),
                        //descrição
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Text(
                                item.description,
                                // overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //botão
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: SizedBox(
                            height: 55,
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: const Text(
                                "Adicionar ao carrinho",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: const Icon(Icons.shopping_cart_outlined),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          // botao voltar
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
