import 'package:ecommecerfrutas/src/models/order_model.dart';
import 'package:ecommecerfrutas/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  const PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'Pagamento com pix',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                //qr code
                QrImageView(
                  data: '123456789fghfhfhfhfh0',
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                //vencimento
                Text(
                  'Vencimento ${UtilsServices.formatDateTime(order.overdueDatetime)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                //total

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: Text(
                    'Total: ${UtilsServices.priceTocurrenci(order.total)}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                //botão copia e cola
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.green,
                    side: const BorderSide(color: Colors.green, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy),
                  label: const Text(
                    'Copiar código Pix',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
