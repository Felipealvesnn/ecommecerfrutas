import 'package:ecommecerfrutas/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({required this.item,required this.quantity});

 double totalPrive(){
    return item.price * quantity;
 }  
}