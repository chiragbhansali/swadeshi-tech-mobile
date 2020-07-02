import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(child: ProductCard('https://www.swadeshitech.in/assets/icons/products/jio.svg', 'Jio', true)),
      )
    );
  }
}
