import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';
import 'package:swadeshittech/widgets/chineseCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swadeshittech/globals.dart' as globals;

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future getData() async {
    print(globals.products);
    // var data = await http.get('https://swadeshitech.in/js/data/products.json');
    // var finalData = json.decode(data.body);
    // return finalData;

    if (globals.products["data"] == "") {
      print("No data");
      var data =
          await http.get('https://swadeshitech.in/js/data/products.json');
      var finalData = json.decode(data.body);
      globals.products["data"] = finalData;
      return finalData;
    } else {
      print("Has data");
      return globals.products["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      //margin: EdgeInsets.only(top: 15),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = (snapshot.data);
            print(data);
            return ListView.builder(
              itemCount: data['productCategories'].length,
              itemBuilder: (context, index) {
                var title = data['productCategories'][index]['name'];
                var id = data['productCategories'][index]['id'];
                return CustomScrollView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(height: 36),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 36),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data['chineseProducts'][id].length,
                          itemBuilder: (context, index2) {
                            var format = data['chineseProducts'][id][index2]
                                ['imageFormat'];
                            String name =
                                data['chineseProducts'][id][index2]['name'];
                            String applogoid = name.toLowerCase();
                            //var url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Onida_Electronics.svg/330px-Onida_Electronics.svg.png';
                            var url =
                                'https://swadeshitech.in/assets/icons/products' +
                                    '/' +
                                    applogoid.replaceAll(' ', '') +
                                    '.$format';
                            return ChineseCardApps(url, format);
                          },
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index2) {
                        int otherAppCount = 0;
                        Map appsObj;
                        bool indian;
                        int arr1length = data['indianProducts'][id].length;
                        print(arr1length);
                        print(" ");
                        print(index2);
                        if (index2 < arr1length) {
                          appsObj = data['indianProducts'][id][index2];
                          indian = true;
                        } else {
                          appsObj =
                              data['otherProducts'][id][index2 - arr1length];
                          indian = false;
                        }
                        String name = appsObj['name'];
                        var appId = (name).toLowerCase();
                        var format = appsObj['imageFormat'];
                        print(format);
                        var imgURL =
                            'https://swadeshitech.in/assets/icons/products' +
                                '/' +
                                appId.replaceAll(' ', '') +
                                '.$format';
                        print(name);
                        print(imgURL);
                        //var url = 'https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Huawei_Standard_logo.svg/189px-Huawei_Standard_logo.svg.png';
                        //var android = appsObj['android'];
                        return ProductCard(imgURL, name, indian, format);
                      },
                          childCount: data['indianProducts'][id].length +
                              data['otherProducts'][id].length),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
