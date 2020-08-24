import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class ProductCard extends StatefulWidget {
  final String url;
  final String name;
  final bool indian;
  final String format;
  ProductCard(this.url, this.name, this.indian, this.format);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.indian == true) {
      return GestureDetector(
        onTap: () => print('${widget.url}   ${widget.format}'),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          //padding: EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            child: Banner(
              message: "INDIAN",
              layoutDirection: TextDirection.ltr,
              location: BannerLocation.topStart,
              color: Colors.green,
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black54)),
                child: AspectRatio(
                  aspectRatio: 1 / 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 6),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 8),
                        widget.format == 'png'
                            ? GestureDetector(
                                onTap: () => print(widget.url),
                                child: CachedNetworkImage(
                                  height: 60,
                                  width: 90,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  placeholder: (context, url) => Container(
                                    height: 60,
                                    width: 60,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  imageUrl: widget.url,
                                ),
                              )
                            : SvgPicture.network(
                                widget.url,
                                height: 60,
                                width: 60,
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF424949),
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        //padding: EdgeInsets.symmetric(horizontal: 3),
        child: ClipRRect(
            child: Container(
          height: 160,
          width: (MediaQuery.of(context).size.width / 2),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black54)),
          child: AspectRatio(
            aspectRatio: 1 / 2,
            child: Container(
              margin: EdgeInsets.only(top: 6),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 8),
                    widget.format == 'png'
                        ? CachedNetworkImage(
                            height: 60,
                            width: 90,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            placeholder: (context, url) => Container(
                              height: 60,
                              width: 60,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            imageUrl: widget.url,
                          )
                        : SvgPicture.network(
                            widget.url,
                            height: 60,
                            width: 60,
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.name,
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF424949),
                            fontWeight: FontWeight.w700)),
                  ]),
            ),
          ),
        )),
      );
    }
  }
}

class AppCard extends StatefulWidget {
  final String name;
  final bool indian;
  final String url;
  final String playURL;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  AppCard(this.name, this.indian, this.url, this.playURL, this.analytics,
      this.observer);
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  Future sendActivityLog(name) async {
    print(name);
    await widget.analytics.logEvent(
        name: name.replaceAll(' ', ''),
        parameters: {"event": "App Button CLicked", "appName": name});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.indian == true) {
      return GestureDetector(
        onTap: () {
          sendActivityLog(widget.name);
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )),
            context: context,
            builder: (context) {
              return Container(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (await canLaunch(widget.playURL)) {
                              await launch(
                                widget.playURL,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 60,
                            width: MediaQuery.of(context).size.width - 48,
                            child: Center(
                              child: Text(
                                'Download From Play Store',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
            },
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: ClipRRect(
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width / 2,
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
                      margin: EdgeInsets.only(top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              height: 60,
                              width: 60,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              placeholder: (context, url) => Container(
                                height: 60,
                                width: 60,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              imageUrl: widget.url,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: widget.name.length >= 8
                                    ? 22
                                    : widget.name.length >= 13 ? 18 : 24,
                                color: Color(0xFF424949),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          sendActivityLog(widget.name);
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )),
            context: context,
            builder: (context) {
              return Container(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (await canLaunch(widget.playURL)) {
                              await launch(
                                widget.playURL,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 60,
                            width: MediaQuery.of(context).size.width - 48,
                            child: Center(
                              child: Text(
                                'Download From Play Store',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
            },
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: ClipRRect(
              child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black54)),
            child: AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
                margin: EdgeInsets.only(top: 7),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 7),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          height: 60,
                          width: 60,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          placeholder: (context, url) => Container(
                            height: 60,
                            width: 60,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          imageUrl: widget.url,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(widget.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: widget.name.length >= 13
                                  ? 19
                                  : widget.name.length >= 8 ? 22 : 24,
                              color: Color(0xFF424949),
                              fontWeight: FontWeight.w700)),
                    ]),
              ),
            ),
          )),
        ),
      );
    }
  }
}
