import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/shop_page.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: ShopWidget()
    );
  }
}
