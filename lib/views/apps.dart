import 'package:flutter/material.dart';
import 'package:swadeshittech/widgets/card.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
            child: AppCard(
                'https://www.swadeshitech.in/assets/icons/roposo.png',
                'Roposo',
                true,
            'https://play.google.com/store/apps/details?id=com.appfluent.quiz')),
      ),
    );
  }
}
