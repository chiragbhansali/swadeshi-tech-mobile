import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swadeshittech/widgets/shop_page.dart';
import 'package:http/http.dart' as http;
import 'package:swadeshittech/globals.dart' as globals;

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  Future getData() async {
    if (globals.shop["data"] == "") {
      print("No data");
      var data = await http.get('https://swadeshitech.in/js/data/shop.json');
      var finalData = json.decode(data.body);
      globals.shop["data"] = finalData;
      return finalData;
    } else {
      print("Has data");
      return globals.shop["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: getData(),
      builder: (context, data) {
        if (data.hasData) {
          return ShopWidget(data.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
