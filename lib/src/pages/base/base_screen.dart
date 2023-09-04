import 'package:ecommecerfrutas/src/home/home_tab.dart';
import 'package:flutter/material.dart';

class BaseScreem extends StatefulWidget {
  const BaseScreem({super.key});

  @override
  State<BaseScreem> createState() => _BaseScreemState();
}

class _BaseScreemState extends State<BaseScreem> {
  int currentIndex = 0;
  final pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pagecontroller,
          children: [
           const HomeTab(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pagecontroller.jumpToPage(index);
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Carrinho",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Pedidos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Perfil",
            ),
          ],
        ));
  }
}
