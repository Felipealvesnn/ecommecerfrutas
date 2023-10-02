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

  bool get isLastPage {
    if (currentew!.items.length < itemsPerPage) return true;
    return currentew!.pagination * itemsPerPage > allProducts.length;
  }

  List<CategoryModel> Allcategories = [];
  RxString searchTitle = ''.obs;

  List<ItemModel> get allProducts => currentew!.items ?? [];

  CategoryModel? currentew;

  void selectCategory(CategoryModel category) {
    currentew = category;
    update();
    if (currentew!.items.isNotEmpty) return;

    getAllProducts();
  }

 

  void filterByTitle() {
    for (var category in Allcategories) {
      category.items.clear();
      category.pagination = 0;
    }

    if (searchTitle.value.isEmpty) {
      Allcategories.removeAt(0);
    } else {
      CategoryModel? c = Allcategories.firstWhereOrNull((cat) => cat.id == '');

      if (c == null) {
        final allProductCategory = CategoryModel(
          id: '',
          title: 'Todos',
          items: [],
          pagination: 0,
        );
        Allcategories.insert(0, allProductCategory);
      } 
      else {
        c.items.clear();
        c.pagination = 0;
      }
    }

    currentew = Allcategories.first;
    update();
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
    debounce(
      searchTitle,
      (callback) {
        print("callback  as Strin");
        filterByTitle();
        update();
      },
      time: const Duration(milliseconds: 600),
    );
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    try {
      final response = await _homeRepository.getAllCategories();

      setLoading(false);
      response.when(success: (data) {
        Allcategories.assignAll(data);
        if (Allcategories.isEmpty) return;
        selectCategory(Allcategories.first);

        // print(data);
      }, error: (error) {
        UtilsServices.showToast(error, errork: true);
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

  loadMorepodructs() {
    currentew!.pagination++;

    getAllProducts(canLoad: false);
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
