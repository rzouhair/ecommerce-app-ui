import 'package:ecom_app/widgets/FilterButton.dart';
import 'package:ecom_app/widgets/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _filters = ['Casual', 'Loafers', 'Sneakers', 'Athletic'];

  final List<ProductItem> _products = [
    ProductItem('id1', 'Air Jordan 1', 'Retro high university blue', 650, [
      const AssetImage('assets/44.png'),
    ]),
    ProductItem(
        'id2', 'New balance 550', "Aimé Leon Dore x 550 'Green Yellow'", 989, [
      const AssetImage('assets/nb550.png'),
    ]),
    ProductItem('id3', 'Air Jordan 1', 'Retro High Rookie Of The Year', 1090, [
      const AssetImage('assets/roty1.png'),
      const AssetImage('assets/roty2.png'),
      const AssetImage('assets/roty3.png'),
    ]),
    ProductItem('id4', 'Nike Blazer', 'Mid 77 Vintage White Black', 899, [
      const AssetImage('assets/blazer1.png'),
      const AssetImage('assets/blazer2.png'),
      const AssetImage('assets/blazer3.png'),
    ]),
  ];

  dynamic _selectedFilter = 'Athletic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Best of\nShoe Collection',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Explore wide range of athletic collection',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _filters
                      .map((f) => FilterButton(
                            label: f,
                            isSelected: _selectedFilter == f,
                            onPress: () {
                              setState(() {
                                _selectedFilter = f;
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    height: 20,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return Product(product: _products[index]);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(9999))),
                child: Row(children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(999)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
