import 'package:flutter/material.dart';

class OrderStatuss extends StatelessWidget {
  final String status;
  final bool isOverdul;

  final Map<String, int> allStatus = {
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };
  int get currentStatus => allStatus[status] ?? 0;

  OrderStatuss({Key? key, required this.status, required this.isOverdul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          title: 'Pedido confirmado',
          isActive: true,
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdul) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento Pix vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: 'Pagamento',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: 'Preparando',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: 'Envio',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            title: 'Entregue',
          ),
        ],
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;
  const _StatusDot(
      {Key? key,
      required this.title,
      this.backgroundColor,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //dot
        Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color:
                isActive ? backgroundColor ?? Colors.green : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Colors.white : Colors.grey,
              width: 3,
            ),
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 13,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 8,
        ),
        //texto
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 10,
      width: 2,
      color: Colors.grey,
    );
  }
}
