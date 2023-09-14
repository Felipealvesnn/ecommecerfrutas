import 'package:flutter/material.dart';

class OrderStatuss extends StatelessWidget {
  final String status;
  final bool isOverdul;
  

  const OrderStatuss({Key? key, required this.status, required this.isOverdul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(isActived: true, title: 'Pedido recebido'),
        _CustomDivider(),
        _StatusDot(isActived: false, title: 'Pedido em preparação'),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActived;
  final String title;
  const _StatusDot({Key? key, required this.title, required this.isActived})
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
            color: isActived ? Colors.green : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: isActived
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
    )  ;
    
    }
}
