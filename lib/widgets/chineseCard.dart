import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChineseCardApps extends StatefulWidget {
  final String url;
  final String format;
  ChineseCardApps(this.url, this.format);
  @override
  _ChineseCardAppsState createState() => _ChineseCardAppsState();
}

class _ChineseCardAppsState extends State<ChineseCardApps> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.url);
      },
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: widget.format == 'png'
                    ? CachedNetworkImage(
                        height: 60,
                        width: 60,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) => Container(
                          height: 80,
                          width: 80,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        imageUrl: widget.url,
                      )
                    : Container(
                        height: 60,
                        width: 60,
                        child: Center(
                            child: SvgPicture.network(
                          widget.url,
                          alignment: Alignment.center,
                        ))),
              ),
              Opacity(
                opacity: 0.60,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 61,
                  width: 61,
                ),
              )
            ]),
      ),
    );
  }
}
