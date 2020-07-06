import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';
import 'dart:convert';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Future getJson()async{
    var result = await DefaultAssetBundle.of(context).loadString('json_data/appDB.json');
    var finalRes = json.decode(result);
    return finalRes;
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
              child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
              ],
            );
          },
        ),
      );
    
  }
}
