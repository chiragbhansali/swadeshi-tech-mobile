import 'package:flutter/material.dart';
import 'package:swadeshittech/views/shop_info.dart';

class ShopCard extends StatefulWidget {
  final String id;
  ShopCard(this.id);
  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ShopInfo(widget.id)));
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 27,
              ),
              Hero(
                tag: '${widget.id}',
                child: Image.network(
                  'https://rukminim1.flixcart.com/image/416/416/k7xnukw0/computer/n/m/e/apple-na-laptop-original-imafq2efm5gyrnug.jpeg?',
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3.6,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Macbook Air Pro',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Rs. 1,100,100',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff515151)),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
