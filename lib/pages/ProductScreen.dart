import 'package:ecom_app/widgets/Product.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final ProductItem product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  List<SizedBox> pages = [];

  @override
  void initState() {
    setState(() {
      pages = widget.product.images.map((i) {
        return SizedBox(
          height: 350,
          width: 400,
          child: Image(
            fit: BoxFit.contain,
            image: i,
          ),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.product.title,
            style: const TextStyle(color: Colors.black)),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: const Icon(
              Icons.more_vert_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
                tag: widget.product.id,
                child: SizedBox(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: controller,
                    physics: pages.length > 1
                        ? null
                        : const NeverScrollableScrollPhysics(),
                    // itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: pages[index % pages.length],
                      );
                    },
                  ),
                )),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 10,
                    strokeWidth: 1,
                    activeDotColor: Colors.black,
                    dotColor: Colors.grey,
                    spacing: 4),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(widget.product.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 12),
                            child: Text(widget.product.subtitle,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Total Price',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '\$ ${widget.product.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 12,
                                ),
                                const Text('Add to cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
