import 'package:ecommecerfrutas/src/home/repository/homeRepository.dart';
import 'package:ecommecerfrutas/src/home/result/home_result.dart';
import 'package:ecommecerfrutas/src/models/category_model.dart';
import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:get/get.dart';

const int itemsPerPage = 6;

class Homecontroller extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  bool isCategoryLoading = false;
  bool isProductLoading = true;

  List<CategoryModel> categories = [];
  RxString searchTitle = ''.obs;

  List<ItemModel> get allProducts => currentew!.items ?? [];

  CategoryModel? currentew;

  void selectCategory(CategoryModel category) {
    currentew = category;
    update();
    if (currentew!.items.isNotEmpty) return;

    getAllProducts();
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    try {
      final response = await _homeRepository.getAllCategories();

      setLoading(false);
      response.when(success: (data) {
        categories.assignAll(data);
        if (categories.isEmpty) return;
        selectCategory(categories.first);

        // print(data);
      }, error: (error) {
        UtilsServices.showToast(error, errork: true);
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllProducts({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      'page': currentew!.pagination,
      'categoryId': currentew!.id,
      'itemsPerPage': itemsPerPage,
    };

    if (searchTitle.value.isNotEmpty) {
      body['title'] = searchTitle.value;

      if (currentew!.id == '') {
        body.remove('categoryId');
      }
    }

    HomeREsult<ItemModel> result = await _homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    result.when(
      success: (data) {
        currentew!.items.addAll(data);
      },
      error: (message) {
        UtilsServices.showToast(
          message,
          errork: true,
        );
      },
    );
  }
}
