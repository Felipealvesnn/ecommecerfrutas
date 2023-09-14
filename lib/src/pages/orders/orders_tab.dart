import 'package:flutter/material.dart';

class Orders_tab extends StatelessWidget {
  const Orders_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order #${index + 1}'),
            subtitle: Text('Order description'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, 'order_detail');
            },
          );
        },
        padding: EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
