import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatefulWidget {
  final String url;
  final String name;
  final bool indian;
  ProductCard(this.url, this.name, this.indian);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width - 48,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54)
        ),
        child: AspectRatio(
          aspectRatio: 1 / 2,
          child: Banner(
            message: "INDIAN",

            layoutDirection: TextDirection.ltr,
            location: BannerLocation.topStart,
            color: Colors.green,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  SvgPicture.network(widget.url, height: 80, width: 80),
                  SizedBox(height: 35,),
                  Text(widget.name,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600
                  ),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
