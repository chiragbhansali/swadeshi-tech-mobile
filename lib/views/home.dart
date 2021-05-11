import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swadeshittech/views/apps.dart';
import 'package:swadeshittech/views/products.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:share/share.dart';
import 'package:swadeshittech/views/shop.dart';

class Home extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  Home(this.analytics, this.observer);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;
  List screens;
  var analytics;
  var observer;

  @override
  void initState() {
    analytics = widget.analytics;
    observer = widget.observer;
    screens = [AppScreen(analytics, observer), ProductScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          centerTitle: true,
          title: Image.asset('assets/SwadeshiTech.png', height: 50, width: 50,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share, size: 24,),
              onPressed: () {
                String message =
                    "Let's all come together and use https://play.google.com/store/apps/details?id=com.swadeshitech.app to find alternatives to replace Chinese apps and products. Let this message reach maximum of your family and friends to be part of our very own Swadeshi revolution!";
                share(context, message);
              },
            )
          ],
        ),
        body: PageView(
            controller: _pageController,
            onPageChanged: (pageNum) {
              setState(() {
                _currentIndex = pageNum;
              });
            },
            children: [
              AppScreen(analytics, observer),
              ProductScreen(),
              Shop()
            ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(2, -2),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.1)
              )
            ]
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            elevation:0,
            selectedIconTheme: IconThemeData(color: Color(0xff258BFF)),
            selectedItemColor: Color(0XFF258BFF),
            //backgroundColor: Colors.orangeAccent,
            selectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.apps, size: 32),
                  title: Text(
                    "Apps",
                    style: TextStyle(fontSize: 16),
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.devices, size: 32),
                  title: Text(
                    "Products",
                    style: TextStyle(fontSize: 16),
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.shopping_cart, size: 32),
                  title: Text(
                    "Store",
                    style: TextStyle(fontSize: 16),
                  ))
            ],
            onTap: (index) {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
              setState(() {});
            },
          ),
        ));
  }

  void share(BuildContext context, message) {
    final RenderBox box = context.findRenderObject();
    Share.share(
      message,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
