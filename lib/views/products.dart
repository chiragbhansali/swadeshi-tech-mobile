import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
            child: ProductCard(
                'https://www.swadeshitech.in/assets/icons/products/jio.svg',
                'Jio',
                true)),
      ),
    );
  }
}
