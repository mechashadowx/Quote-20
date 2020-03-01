import 'package:flutter/material.dart';
import 'package:quote/helper.dart';
import 'package:quote/home/QuotePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  go() {
    Navigator.pushNamed(context, QuotePage.id);
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: blackBlue,
      body: Container(
        padding: EdgeInsets.all(data.size.width * 0.1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    'Today’s Quote',
                    style: TextStyle(
                      color: cyan,
                      fontSize: data.size.width * 0.2,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: data.size.width * 0.1),
                child: GestureDetector(
                  onTap: go,
                  child: Container(
                    child: Center(
                      child: Image.asset(
                        'images/GO.png',
                        height: data.size.width * 0.2,
                        width: data.size.width * 0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
