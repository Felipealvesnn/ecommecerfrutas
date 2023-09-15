import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';// importante pra data funcionar
import 'package:intl/intl.dart';

class UtilsServices {

  // R$ valo
  static String priceTocurrenci(double price) {
   var vvalor =   NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(price);

    return vvalor;  //"R\$ ${price.toStringAsFixed(2)}";
  }
  static String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

 static void  showToast(String message,{ bool errork = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 253, 6, 6).withOpacity(0.8),
      textColor: errork?Colors.red:Colors.white,
      fontSize: 16.0,
    );
  }
  
}