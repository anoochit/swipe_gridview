import 'package:flutter/material.dart';
import 'package:swipecard/models/product.dart';
import 'package:swipecard/widgets/swipe_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Swipe'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 100 / 120,
        ),
        itemCount: listProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return SwipeItem(product: listProduct[index]);
        },
      ),
    );
  }
}
