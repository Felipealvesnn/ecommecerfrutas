import 'package:ecommecerfrutas/src/home/repository/homeRepository.dart';
import 'package:ecommecerfrutas/src/models/category_model.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  bool isLoading = false;
  List<CategoryModel> categories = [];
  CategoryModel? currentew;

  void selectCategory(CategoryModel category) {
    currentew = category;
    update();
  }

  void setLoading(bool value) {
    isLoading = value;
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

        print(data);
      }, error: (error) {
        UtilsServices.showToast(error, errork: true);
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
