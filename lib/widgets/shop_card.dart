import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swadeshittech/views/shop_info.dart';

class ShopCard extends StatefulWidget {
  final String id;
  final Map data;
  ShopCard(this.id, this.data);
  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 300),
                pageBuilder: (_, __, ___) => ShopInfo(widget.id, widget.data)));
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 165,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 34
              ),
              Hero(
                tag: '${widget.id}',
                child: Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width / 3,
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (context, url) => Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    imageUrl:
                        'https://swadeshitech.in/assets/img/products/${widget.data["image"]}',
                        height: 150,
                    width: MediaQuery.of(context).size.width / 3.6,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 14,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.data["Name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Rs. ${widget.data["MRP"]}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff515151)),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
