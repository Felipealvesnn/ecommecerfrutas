import 'package:ecommecerfrutas/src/constants/endsPotins.dart';
import 'package:ecommecerfrutas/src/home/result/home_result.dart';
import 'package:ecommecerfrutas/src/models/category_model.dart';
import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:ecommecerfrutas/src/services/http_manager.dart';

class HomeRepository {

  Future<HomeREsult<CategoryModel>> getAllCategories() async {
    final result = await HttpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();

      return HomeREsult<CategoryModel>.success(data);
    } else {
      return HomeREsult.error(
          'Ocorreu um erro inesperado ao recuperar as categorias');
    }
  }

  Future<HomeREsult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await HttpManager.restRequest(
      url: Endpoints.getAllProducts,
      method: HttpMethods.post,
      body: body,
    );

    if (result['result'] != null) {
      List<ItemModel> data = List<Map<String, dynamic>>.from(result['result'])
          .map(ItemModel.fromJson)
          .toList();

      return HomeREsult<ItemModel>.success(data);
    } else {
      return HomeREsult.error(
          'Ocorreu um erro inesperado ao recuperar os itens');
    }
  }
  
}
