import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:ecommecerfrutas/src/config/app_data.dart' as AppData;
import 'package:ecommecerfrutas/src/home/view/components/CategoryTile.dart';
import 'package:ecommecerfrutas/src/home/view/components/item_title.dart';
import 'package:ecommecerfrutas/src/home/controller/home_controller.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/app_name.dart';
import 'package:ecommecerfrutas/src/pages/communs_widgets/custom_shimmer.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  final seachingcontroller = TextEditingController();
  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
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
            GetBuilder<Homecontroller>(
              initState: (_) {},
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child:
                      // parte de pesquisa
                      TextFormField(
                    controller: seachingcontroller,
                    onChanged: (value) {
                      controller.searchTitle.value = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16), // Ajuste o valor conforme necessário
                      isDense: true,
                      hintText: "Pesquisar",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 21,
                      ),
                      suffixIcon: controller.searchTitle.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                controller.searchTitle.value = '';
                                seachingcontroller.clear();
                                FocusScope.of(context).unfocus();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 21,
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),

                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                );
              },
            ),

            //lista de categorias
            GetBuilder<Homecontroller>(
              init: Homecontroller(),
              initState: (_) {},
              builder: (controller) {
                return Container(
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(left: 16),
                    child: !controller.isCategoryLoading
                        ? ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: controller.Allcategories.length,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                onPressed: () {
                                  controller.selectCategory(
                                      controller.Allcategories[index]);
                                },
                                Category: controller.Allcategories[index].title,
                                isSelect: controller.Allcategories[index] ==
                                    controller.currentew,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 16,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: controller.Allcategories.length,
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
                          ));
              },
            ),
            //produtos

            GetBuilder<Homecontroller>(
              builder: (controller) {
                return Expanded(
                    child: Visibility(
                  visible: !controller.isProductLoading,
                  replacement: GridView.count(
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
                  child: Visibility(
                    visible: (controller.currentew?.items ?? []).isNotEmpty,
                    replacement: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 100,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemCount: controller.allProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        if (index + 1 == controller.allProducts.length) {
                          if (!controller.isLastPage) {
                            controller.loadMorepodructs();
                          }
                        }
                        return item_title(
                          item: controller.allProducts[index],
                          runAddToCardAnimation: itemSelectedCartAnimations,
                        );
                      },
                    ),
                  ),
                ));
              },
            ),
          ],
        ),
      ),
      //categorias

      //grid
    );
  }
}
