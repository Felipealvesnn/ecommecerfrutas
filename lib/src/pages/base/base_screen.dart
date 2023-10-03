import 'package:ecommecerfrutas/src/home/view/home_tab.dart';
import 'package:ecommecerfrutas/src/pages/base/controller/navigation_controller.dart';
import 'package:ecommecerfrutas/src/pages/cart/cart_tab.dart';
import 'package:ecommecerfrutas/src/pages/orders/orders_tab.dart';
import 'package:ecommecerfrutas/src/pages/profile/profile_dev.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScreem extends StatefulWidget {
  const BaseScreem({super.key});

  @override
  State<BaseScreem> createState() => _BaseScreemState();
}

class _BaseScreemState extends State<BaseScreem> {
  final navigationController = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: const [
          HomeTab(),
          CartTab(),
          Orders_tab(),
          Profile_tab(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            onTap: (index) {
              navigationController.navigationPageview(index);
            },
            currentIndex: navigationController.currentIndex,
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
          )),
    );
  }
}
