import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swadeshittech/views/apps.dart';
import 'package:swadeshittech/views/products.dart';
import 'package:share/share.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List screens = [AppScreen(), ProductScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          centerTitle: true,
          title: SvgPicture.network(
            'https://www.swadeshitech.in/assets/img/SwadeshiTechLogoNew.svg',
            height: 70,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share, size: 28),
              onPressed: (){
                String message = "Let's all come together and use https://swadeshitech.in/download/ to find alternatives to replace Chinese apps and products. Let this message reach maximum of your family and friends to be part of our very own Swadeshi revolution!";
                share(context, message );
              },
            )
          ],
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          elevation: 5,
          //backgroundColor: Colors.orangeAccent,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.apps, size: 35),
                title: Text(
                  "Apps",
                  style: TextStyle(fontSize: 22),
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.shopping_basket, size: 35),
                title: Text(
                  "Products",
                  style: TextStyle(fontSize: 22),
                ))
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }


  void share( BuildContext context, message){
    final RenderBox box = context.findRenderObject();
    Share.share(message, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size, );
  }
}
