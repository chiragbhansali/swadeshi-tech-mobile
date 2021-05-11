import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/shop_card.dart';
import 'dart:math';
import 'package:swadeshittech/globals.dart' as globals;

class ShopWidget extends StatefulWidget {
  final Map data;
  ShopWidget(this.data);
  @override
  _ShopWidgetState createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  List categs;
  Map selectedCateg;
  List brands;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
    categs = widget.data["categs"];
    selectedCateg = globals.shopSelectCateg["data"] == ""
        ? categs[0]
        : globals.shopSelectCateg["data"];
    brands = widget.data[selectedCateg["code"]].keys.toList();
    print(brands);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Expanded(
                  child: Text(
                    '${selectedCateg["name"]}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2,
                                            color: Color(0xFFDCDCDC)))),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Change Category',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF1D1D1D),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: categs.length,
                                    itemBuilder: (context, index) {
                                      return MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedCateg = categs[index];
                                            globals.shopSelectCateg["data"] =
                                                categs[index];
                                            brands = widget
                                                .data[selectedCateg["code"]]
                                                .keys
                                                .toList();
                                          });
                                          Future.delayed(
                                              Duration(milliseconds: 400), () {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10, bottom: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                IconData(
                                                    int.parse(categs[index]
                                                        ["iconCode"]),
                                                    fontFamily:
                                                        'MaterialIcons'),
                                                color: Color(0xff808080),
                                                size: 32,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              Text(
                                                categs[index]["name"],
                                                style: TextStyle(
                                                    color: Color(0xff212121),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Change Category',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return ListView.builder(
                  itemCount:
                      widget.data[selectedCateg["code"]][brands[index]].length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index2) {
                    return ShopCard(
                        (widget.data[selectedCateg["code"]][brands[index]]
                            [index2]["Name"]),
                        widget.data[selectedCateg["code"]][brands[index]]
                            [index2]);
                  },
                );
              }),
        )
      ],
    ));
  }
}
