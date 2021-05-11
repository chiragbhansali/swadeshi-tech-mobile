import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:swadeshittech/views/home.dart';

class SplashScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  SplashScreen(this.analytics, this.observer);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(widget.analytics, widget.observer)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home(widget.analytics, widget.observer)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.7),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Image.asset(
            'assets/Swadeshi_Tech2.png',
             height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,),
        ),
      ),
    ));
  }
}
