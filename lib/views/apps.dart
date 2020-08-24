import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:swadeshittech/widgets/chineseCard.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:swadeshittech/globals.dart' as globals;

class AppScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  AppScreen(this.analytics, this.observer);
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Future getData() async {
    if (globals.apps["data"] == "") {
      print("No data");
      var data = await http.get('https://swadeshitech.in/js/data/apps.json');
      var finalData = json.decode(data.body);
      globals.apps["data"] = finalData;
      return finalData;
    } else {
      print("Has data");
      return globals.apps["data"];
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
              itemCount: data['appCategories'].length,
              itemBuilder: (context, index) {
                var title = data['appCategories'][index]['name'];
                var id = data['appCategories'][index]['id'];
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
                          itemCount: data['chineseApps'][id].length,
                          itemBuilder: (context, index2) {
                            String name = data['chineseApps'][id][index2];
                            String applogoid = name.toLowerCase();
                            var url =
                                'https://www.swadeshitech.in/assets/icons' +
                                    '/' +
                                    applogoid.replaceAll(' ', '') +
                                    '.png';
                            return ChineseCardApps(url, 'png');
                          },
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250),
                      delegate: SliverChildBuilderDelegate((context, index2) {
                        int otherAppCount = 0;
                        Map appsObj;
                        bool indian;
                        int arr1length = data['indianApps'][id].length;
                        print(arr1length);
                        print(" ");
                        print(index2);
                        if (index2 < arr1length) {
                          appsObj = data['indianApps'][id][index2];
                          indian = true;
                        } else {
                          appsObj = data['otherApps'][id][index2 - arr1length];
                          indian = false;
                        }
                        String name = appsObj['name'];
                        var appId = (name).toLowerCase();
                        var imgURL =
                            'https://www.swadeshitech.in/assets/icons' +
                                '/' +
                                appId.replaceAll(' ', '') +
                                '.png';
                        print(name);
                        var android = appsObj['android'];
                        return AppCard(name, indian, imgURL, android,
                            widget.analytics, widget.observer);
                      },
                          childCount: data['indianApps'][id].length +
                              data['otherApps'][id].length),
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
