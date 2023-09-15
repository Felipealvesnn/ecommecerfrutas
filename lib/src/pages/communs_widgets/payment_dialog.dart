import 'package:flutter/material.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Pagamento com pix',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),

          //qr code
          

          //vencimento

          //total
        ],
      ),
    );
  }
}
