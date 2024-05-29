import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.items.length == 0
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return CartItem(cart.items[index]);
              },
            ),
    );
  }
}
