import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imageUrl),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Ksh. ${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(product.description),
            SizedBox(height: 16),
            // Using Consumer to dynamically change button text
            Consumer<CartProvider>(
              builder: (context, cart, _) {
                bool isInCart = cart.items.contains(product);
                return ElevatedButton(
                  onPressed: () {
                    if (isInCart) {
                      cart.removeItem(product);
                    } else {
                      cart.addItem(product);
                    }
                  },
                  child: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Purchase now logic
              },
              child: Text('Purchase Now'),
            ),
            ElevatedButton(
              onPressed: () {
                _launchURL('https://wa.link/c1lgxo');
              },
              child: Text('Buy Quickly via WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
