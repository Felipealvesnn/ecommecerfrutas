import 'package:ecommecerfrutas/src/models/cart_item_model.dart';
import 'package:ecommecerfrutas/src/models/item_model.dart';
import 'package:ecommecerfrutas/src/models/order_model.dart';
import 'package:ecommecerfrutas/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categorias = [
  "Frutas",
  "Legumes",
  "Verduras",
  "Temperos",
  "Outros",
];
List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 4),
  CartItemModel(item: grape, quantity: 5),
  CartItemModel(item: guava, quantity: 6),
  CartItemModel(item: kiwi, quantity: 1),
  CartItemModel(item: mango, quantity: 2),
  CartItemModel(item: papaya, quantity: 3),
];

UseModal Userprograma = UseModal(
  name: 'João',
  email: 'tests@gmail.com',
  phone: '999999999',
  cpf: '99999999999',
  password: '123456',
);


List<OrderModel> orders = [
OrderModel(
  id: '1',
  createDatetime: DateTime.now(),
  items: cartItems,
  overdueDatetime: DateTime.now(),
  status: 'Pendente',
  copyandpaste: '1',
  total: 100,
),
OrderModel(
  id: '2',
  createDatetime: DateTime.now(),
  items: cartItems,
  overdueDatetime: DateTime.now(),
  status: 'Pendente',
  copyandpaste: '1',
  total: 100,
),
OrderModel(
  id: '3',
  createDatetime: DateTime.now(),
  items: cartItems,
  overdueDatetime: DateTime.now(),
  status: 'Pendente',
  copyandpaste: '1',
  total: 100,
),
OrderModel(
  id: '4',
  createDatetime: DateTime.now(),
  items: cartItems,
  overdueDatetime: DateTime.now(),
  status: 'Pendente',
  copyandpaste: '1',
  total: 100,
),
];
