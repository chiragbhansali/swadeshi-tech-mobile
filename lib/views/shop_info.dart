import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopInfo extends StatefulWidget {
  final String id;
  final Map data;
  ShopInfo(this.id, this.data);
  @override
  _ShopInfoState createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  String tatacliq;
  String amazon;
  String flipkart;
  List specs;
  List keys;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tatacliq = widget.data["shop"]["tatacliq"];
    amazon = widget.data["shop"]["amazon"];
    flipkart = widget.data["shop"]["flipkart"];
    specs = widget.data.keys.toList();
    specs.remove('image');
    specs.remove('Name');
    specs.remove('shop');
    specs.remove('MRP');
    print(specs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          centerTitle: true,
          title: Image.asset(
            'assets/SwadeshiTech.png',
            height: 60,
            width: 60,
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Hero(
                  tag: '${widget.id}',
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (context, url) => Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 48,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    imageUrl:
                        'https://swadeshitech.in/assets/img/products/${widget.data["image"]}',
                    height: 200,
                    width: MediaQuery.of(context).size.width - 48,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 40, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.data["Name"],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rs. ${widget.data["MRP"]}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Divider(
                  color: Color(0xffDBDBDB),
                  height: 50,
                  thickness: 2,
                  indent: MediaQuery.of(context).size.width / 7,
                  endIndent: MediaQuery.of(context).size.width / 7,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Available On:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff515151),
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 16,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    tatacliq == ""
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              if (await canLaunch(tatacliq)) {
                                await launch(
                                  tatacliq,
                                );
                              }
                            },
                            child: Image.asset('assets/tatacliq.png')),
                    flipkart == ""
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              if (await canLaunch(flipkart)) {
                                await launch(
                                  flipkart,
                                );
                              }
                            },
                            child: Image.asset('assets/flipkart.png'),
                          ),
                    amazon == ""
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              if (await canLaunch(amazon)) {
                                await launch(
                                  amazon,
                                );
                              }
                            },
                            child: Image.asset('assets/amazon.png'),
                          )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Details:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff515151),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                //height: 500,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Color(0xffDBDBDB),
                  ),
                  child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text('', style: TextStyle(fontSize: 2))),
                        DataColumn(
                            label: Text('', style: TextStyle(fontSize: 2))),
                      ],
                      rows: specs
                          .map((spec) => DataRow(cells: [
                                DataCell(Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      spec,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ))),
                                DataCell(Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      widget.data[spec],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF131313)),
                                    ))),
                              ]))
                          .toList()),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
