import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/models/item_model.dart';

class OrderModel {
  String id;
  DateTime createDatetime;
  List<CartItemModel> items;
  DateTime overdueDatetime;
  String status;
  String copyandpaste;
  double total;

  OrderModel({
  required this.id,
  required this.createDatetime,
  required this.items,
  required this.overdueDatetime,
  required this.status,
  required this.copyandpaste,
  required this.total,
  });
  
}