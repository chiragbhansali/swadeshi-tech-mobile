import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
          return Scaffold(
      body: Container(
      padding: EdgeInsets.symmetric(horizontal: 7.7),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.green],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter
          )
      ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Swadeshi Tech',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 50,
                  fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(0.1),
                  child: Text(
                    'Find Alternatives to Replace Chinese Apps and Products',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
