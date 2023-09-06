import 'package:intl/intl.dart';

class UtilsServices {

  // R$ valo
  static String priceTocurrenci(double price) {
   var vvalor =   NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(price);

    return vvalor;  //"R\$ ${price.toStringAsFixed(2)}";
  }
  
}