import 'package:ecommecerfrutas/src/home/components/CategoryTile.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  List<String> categorias = [
    "Frutas",
    "Legumes",
    "Verduras",
    "Temperos",
    "Outros",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Frutas",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: "App",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: Color.fromARGB(255, 240, 31, 3),
                label: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      //campo de pesquisa

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16), // Ajuste o valor conforme necessário
                isDense: true,
                hintText: "Pesquisar",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),

                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  Category: categorias[index],
                  isSelect: index == 0,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 16,
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
      //categorias

      //grid
    );
  }
}
