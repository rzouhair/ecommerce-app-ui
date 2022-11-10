import 'package:ecom_app/pages/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Product extends StatefulWidget {
  Product({super.key, required this.product});

  final ProductItem product;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(product: widget.product)));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade800,
            borderRadius: const BorderRadius.all(Radius.elliptical(24, 24))),
        height: 130,
        child: Slidable(
          // Specify a key if the Slidable is dismissible.
          key: Key(widget.product.id),

          // The start action pane is the one at the left or the top side.

          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            extentRatio: 1 / 3,
            dragDismissible: true,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 1,
                onPressed: (context) {},
                backgroundColor: Colors.deepPurple.shade800,
                foregroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(30, 30),
                    bottomRight: Radius.elliptical(30, 30)),
                icon: Icons.favorite_border,
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                icon: Icons.shopping_cart_outlined,
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(24, 24))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    width: 160,
                    height: 160,
                    child: Hero(
                      tag: widget.product.id,
                      child: Image(
                        image: widget.product.images[0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(widget.product.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    )),
                                Container(
                                  height: 2,
                                ),
                                Text(widget.product.subtitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color:
                                            Color(Colors.grey.shade600.value),
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                          Text(
                            '\$ ${widget.product.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class ProductItem {
  String id;
  String title = '-';
  String subtitle = '-';
  double price = 999;
  List<AssetImage> images;

  ProductItem(this.id, this.title, this.subtitle, this.price, this.images);
}
