import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';
import 'package:swadeshittech/widgets/chineseCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future getData() async {
    var data = await http.get('https://www.swadeshitech.in/js/data/products.json');
    var quizData = json.decode(data.body);
    return quizData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.only(top: 15),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              var data = (snapshot.data);
              print(data);
              return ListView.builder(
                itemCount: data['productCategories'].length,
                itemBuilder: (context, index){
                  var title = data['productCategories'][index]['name'];
                  var id = data['productCategories'][index]['id'];
                  return CustomScrollView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Row(
                            children: <Widget>[
                              SizedBox(width: 6,),
                              Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36
                                ),
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
                            itemBuilder: (context, index2){
                              var format = data['chineseProducts'][id][index2]['imageFormat'];
                              String name = data['chineseProducts'][id][index2]['name'];
                              String applogoid = name.toLowerCase();
                              var url = 'https://www.swadeshitech.in/assets/icons/products' + '/' + applogoid.replaceAll(' ', '') +'.$format' ;
                              return ChineseCardApps(url, format);
                            },
                          ),
                        ),
                      ),
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 197
                        ),
                        delegate: SliverChildBuilderDelegate(
                                (context, index2) {
                              int otherAppCount = 0;
                              Map appsObj;
                              bool indian;
                              int arr1length = data['indianProducts'][id].length;
                              print(arr1length); print(" ");
                              print(index2);
                              if (index2 < arr1length) {
                                appsObj = data['indianProducts'][id][index2];
                                indian = true;}
                              else {
                                appsObj = data['otherProducts'][id][index2-arr1length];
                                indian = false;
                              }
                              String name = appsObj['name'];
                              var appId = (name).toLowerCase();
                              var format = appsObj['imageFormat'];
                              var imgURL = 'https://www.swadeshitech.in/assets/icons/products' + '/' + appId.replaceAll(' ', '') + '.$format';
                              print(name);
                              //var android = appsObj['android'];
                              return  ProductCard(imgURL, name, indian, format);
                            },
                            childCount: data['indianProducts'][id].length + data['otherProducts'][id].length
                        ),
                      ),
                    ],
                  );
                },
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    );
  }
}
