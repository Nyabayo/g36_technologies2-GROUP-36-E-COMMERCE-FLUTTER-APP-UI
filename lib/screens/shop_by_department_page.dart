import 'package:flutter/material.dart';
import 'product_details_page.dart';
import '../models/product.dart';

class ShopByDepartmentPage extends StatelessWidget {
  final List<Product> products = [
    // Computers & Accessories
    Product(
      id: '1',
      name: 'HP ENVY x360 13-bf0003na',
      description: 'Intel Core i5 processor, 8GB Ram, 512GB SSD\n\nWe like: Flexible design\nWe don\'t like: Mediocre webcam in our tests\n\nThis laptop has a 13-inch screen that can be flipped around to be used like a large tablet. It weighs 1.39kg, which is about average for a 2-in-1, 13-inch laptop. This means it’s light enough to be carried around in a bag all day without causing much bother. It isn’t huge, but there are enough ports to keep most people happy.',
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
      description: 'Up to 25 pages per minute in b/w and colour\nOutstanding image quality due to advanced colour technology\nStandard print resolution of 1,200 x 1,200 dpi, 2 bit depth (equivalent of 4,800 x 1,200 dpi)\nFlexible paper handling from A6 up to SRA3 for up to 7,150 sheets\nProductive finishing options including a space-saving inner finisher\n4 GB RAM, 32 GB SSD + optional 320 GB HDD memory and storage\nSelectable one-path duplex and 2 reversing document processors\nComprehensive support for all state of-the-art mobile communications',
      price: 450000,
      imageUrl: 'images/Printer.jpg',
      category: 'Computers & Accessories',
    ),
    // Mobile Devices & Accessories
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
      name: 'Vention 20000mAh Power Bank (Micro-USB + USB-C + USB-A + USB-A) 22.5W White-FHLB0',
      description: '',
      price: 2800,
      imageUrl: 'images/Power%20Bank.jpg',
      category: 'Mobile Devices & Accessories',
    ),
    // Home Entertainment
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
      name: 'Turn Your Analogue TV Smart Android TV by purchasing This Android 11 Set-top Box',
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop by Department'),
      ),
      body: ListView(
        children: <Widget>[
          _buildDepartment(context, 'Computers & Accessories'),
          _buildDepartment(context, 'Mobile Devices & Accessories'),
          _buildDepartment(context, 'Home Entertainment'),
        ],
      ),
    );
  }

  Widget _buildDepartment(BuildContext context, String department) {
    final departmentProducts =
        products.where((product) => product.category == department).toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            department,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: departmentProducts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(departmentProducts[index].imageUrl),
                title: Text(departmentProducts[index].name),
                subtitle: Text('Ksh. ${departmentProducts[index].price}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                          product: departmentProducts[index]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
