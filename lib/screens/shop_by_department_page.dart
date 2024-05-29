import 'package:flutter/material.dart';
import 'product_details_page.dart';
import '../models/product.dart';

class ShopByDepartmentPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'HP ENVY x360 13-bf0003na',
      description: 'Intel Core i5 processor, 8GB Ram, 512GB SSD',
      price: 45000,
      imageUrl: 'images/laptop.jpg',
      category: 'Computers & Accessories',
    ),
    // Add other products similarly
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop by Department'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(products[index].imageUrl),
            title: Text(products[index].name),
            subtitle: Text('Ksh. ${products[index].price}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
