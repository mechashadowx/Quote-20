import 'package:flutter/material.dart';
import 'package:quote/home/QuotePage.dart';

import 'home/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: HomePage(),
      routes: {
        QuotePage.id: (context) => QuotePage(),
      },
    );
  }
}
