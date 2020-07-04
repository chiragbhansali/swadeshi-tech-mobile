import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
    if (widget.indian == true) {
      return ClipRRect(
        child: Container(
          height: 180,
          width: 340,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black54)),
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
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )),
            ),
          ),
        ),
      );
    } else {
      return ClipRRect(
          child: Container(
        height: 180,
        width: 340,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black54)),
        child: AspectRatio(
          aspectRatio: 1 / 2,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(children: <Widget>[
              SizedBox(height: 10),
              SvgPicture.network(widget.url, height: 80, width: 80),
              SizedBox(
                height: 35,
              ),
              Text(widget.name,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      ));
    }
  }
}

class AppCard extends StatefulWidget {
  final String name;
  final bool indian;
  final String url;
  final String playURL;
  AppCard(this.url, this.name, this.indian, this.playURL);
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.indian == true) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),)),
              context: context,
              builder: (context) {
                return Container(
                  height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: GestureDetector(
                        onTap: ()async{
                          if(await canLaunch(widget.playURL)){
                            await launch(widget.playURL,);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          height: 60,
                          width: MediaQuery.of(context).size.width - 48,
                          child: Center(
                            child: Text(
                                'Download From Play Store',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ));
              },);
        },
        child: ClipRRect(
          child: Container(
            height: 180,
            width: 340,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black54)),
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
                        Image.network(widget.url, height: 80, width: 80),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      );
    } else {
      return ClipRRect(
          child: Container(
        height: 180,
        width: 340,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black54)),
        child: AspectRatio(
          aspectRatio: 1 / 2,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(children: <Widget>[
              SizedBox(height: 10),
              Image.network(widget.url, height: 80, width: 80),
              SizedBox(
                height: 35,
              ),
              Text(widget.name,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      ));
    }
  }
}
