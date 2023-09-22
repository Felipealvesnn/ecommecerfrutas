import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:ecommecerfrutas/src/config/app_data.dart' as AppData;
import 'package:ecommecerfrutas/src/home/components/CategoryTile.dart';
import 'package:ecommecerfrutas/src/home/components/item_title.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/app_name.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/custom_shimmer.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String categoriaSelecionada = "Frutas";
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            UtilsServices.showToast('dd', errork: true);
          },
          child: const AppnameWidget(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: const Color.fromARGB(255, 240, 31, 3),
                label: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //campo de pesquisa
      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child:
                  // parte de pesquisa
                  TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
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
            //lista de categorias
            Container(
              height: 30,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.only(left: 16),
              child:!isLoading ? ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: AppData.categorias.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        categoriaSelecionada = AppData.categorias[index];
                      });
                    },
                    Category: AppData.categorias[index],
                    isSelect: AppData.categorias[index] == categoriaSelecionada,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                scrollDirection: Axis.horizontal,
              ): ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: AppData.categorias.length,
                itemBuilder: (context, index) {
                  return CustomShimmer(
                    height: 30,
                    width: 100,
                    isRounded: true,
                    borderRadius: BorderRadius.circular(10),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                scrollDirection: Axis.horizontal,
              )
            ),
            Expanded(
              child: !isLoading
                  ? GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemCount: AppData.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return item_title(
                          item: AppData.items[index],
                          runAddToCardAnimation: itemSelectedCartAnimations,
                        );
                      },
                    )
                  : GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: List.generate(
                        4,
                        (index) {
                          return CustomShimmer(
                            height: 200,
                            width: 200,
                            isRounded: true,
                            borderRadius: BorderRadius.circular(10),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
      //categorias

      //grid
    );
  }
}
