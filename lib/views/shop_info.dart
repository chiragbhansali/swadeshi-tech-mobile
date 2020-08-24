import 'package:flutter/material.dart';

class ShopInfo extends StatefulWidget {
  final String id;
  ShopInfo(this.id);
  @override
  _ShopInfoState createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          centerTitle: true,
          title: Image.asset('assets/SwadeshiTech.png', height: 70, width: 70,)
        ),
      body: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Hero(
            tag: '${widget.id}',
            child: Image.network(
              'https://rukminim1.flixcart.com/image/416/416/k7xnukw0/computer/n/m/e/apple-na-laptop-original-imafq2efm5gyrnug.jpeg?',
              height: 300,
              width: MediaQuery.of(context).size.width - 24,
            ),
          ),
        ),
      ),
    );
  }
}
