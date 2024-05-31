import 'package:flutter/material.dart';
import 'package:g36_technologies2/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'product_details_page.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'HP ENVY x360 13-bf0003na',
      description:
          'Intel Core i5 processor, 8GB Ram, 512GB SSD. We like: Flexible design. We don\'t like: Mediocre webcam in our tests.',
      price: 45000,
      imageUrl: 'images/laptop.jpg',
      category: 'Computers & Accessories',
    ),
    Product(
      id: '2',
      name: 'Dell OptiPlex 7040 SFF Core I7-6700',
      description: '16GB RAM 256GB SSD | Dual Monitor Package',
      price: 480000,
      imageUrl: 'images/Desktop.jpg',
      category: 'Computers & Accessories',
    ),
    Product(
      id: '3',
      name: 'Transcend 1TB USB 3.1 Portable External Hard Drive',
      description: '25M3 StoreJet',
      price: 10800,
      imageUrl: 'images/hdd.jpg',
      category: 'Computers & Accessories',
    ),
    Product(
      id: '4',
      name: 'Kyocera TASKalfa M2552cidn A3 Colour Multifunction Laser Printer',
      description: 'Up to 25 pages per minute in b/w and colour...',
      price: 450000,
      imageUrl: 'images/Printer.jpg',
      category: 'Computers & Accessories',
    ),
    Product(
      id: '5',
      name: 'ip12 Pro MAX Unlocked Smartphone for Android 8.1',
      description: '6.26in 18GB HD Screen Cell Phone Dual Card Dual',
      price: 20082,
      imageUrl: 'images/Smartphone.jpg',
      category: 'Mobile Devices & Accessories',
    ),
    Product(
      id: '6',
      name: 'Redmi watch 3 Active Smart watch (New Arrival) global version',
      description: '',
      price: 6999,
      imageUrl: 'images/smartwatch.jpg',
      category: 'Mobile Devices & Accessories',
    ),
    Product(
      id: '7',
      name: 'onn. 7" Tablet, 32GB (2022 Model)',
      description: '2.0 GHz Quad-Core Processor, Charcoal',
      price: 59000,
      imageUrl: 'images/tablet.jpg',
      category: 'Mobile Devices & Accessories',
    ),
    Product(
      id: '8',
      name:
          'Vention 20000mAh Power Bank (Micro-USB + USB-C + USB-A + USB-A) 22.5W White-FHLB0',
      description: '',
      price: 2800,
      imageUrl: 'images/Power%20Bank.jpg',
      category: 'Mobile Devices & Accessories',
    ),
    Product(
      id: '9',
      name: 'Hisense 65 inch TV Smart 4K UHD Frameless 65A7GKEN',
      description: '',
      price: 89995,
      imageUrl: 'images/Television.jpg',
      category: 'Home Entertainment',
    ),
    Product(
      id: '10',
      name: 'LG LHD657 5.1CH 1000W Home Theatre System',
      description: '',
      price: 44999,
      imageUrl: 'images/Home%20Theater%20System.jpg',
      category: 'Home Entertainment',
    ),
    Product(
      id: '11',
      name:
          'Turn Your Analogue TV Smart Android TV by purchasing This Android 11 Set-top Box',
      description: '',
      price: 2780,
      imageUrl: 'images/Streaming%20Device1.jpg',
      category: 'Home Entertainment',
    ),
    Product(
      id: '12',
      name: 'Meta Quest 2 Advanced All-in-One VR Headset',
      description: '',
      price: 45000,
      imageUrl: 'images/VR%20Headsetsare.webp',
      category: 'Home Entertainment',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final searchQuery =
        Provider.of<SearchProvider>(context).searchQuery.toLowerCase();

    // Filter products based on search query for both category and product name
    final filteredProducts = products.where((product) {
      final productName = product.name.toLowerCase();
      final productCategory = product.category.toLowerCase();
      return productName.contains(searchQuery) ||
          productCategory.contains(searchQuery);
    }).toList();

    return ListView(
      children: <Widget>[
        if (filteredProducts
            .any((product) => product.category == 'Computers & Accessories'))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Computers & Accessories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        if (filteredProducts
            .any((product) => product.category == 'Computers & Accessories'))
          _buildProductCategory(
              context, 'Computers & Accessories', filteredProducts),
        if (filteredProducts.any(
            (product) => product.category == 'Mobile Devices & Accessories'))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Mobile Devices & Accessories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        if (filteredProducts.any(
            (product) => product.category == 'Mobile Devices & Accessories'))
          _buildProductCategory(
              context, 'Mobile Devices & Accessories', filteredProducts),
        if (filteredProducts
            .any((product) => product.category == 'Home Entertainment'))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Home Entertainment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        if (filteredProducts
            .any((product) => product.category == 'Home Entertainment'))
          _buildProductCategory(
              context, 'Home Entertainment', filteredProducts),
      ],
    );
  }

  Widget _buildProductCategory(
      BuildContext context, String category, List<Product> filteredProducts) {
    final categoryProducts = filteredProducts
        .where((product) => product.category == category)
        .toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categoryProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsPage(product: categoryProducts[index]),
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(categoryProducts[index].imageUrl, height: 100),
              Text(categoryProducts[index].name),
              Text('Ksh. ${categoryProducts[index].price}'),
            ],
          ),
        );
      },
    );
  }
}
