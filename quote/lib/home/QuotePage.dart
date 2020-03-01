import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quote/helper.dart';
import 'package:http/http.dart' as http;

class QuotePage extends StatefulWidget {
  static final String id = 'QuotePage';

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String quote;
  String url;

  @override
  void initState() {
    super.initState();
    quote = '';
    url =
        'https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=jsonp&jsonp=?';

    getJsonData();
  }

  Future<void> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    setState(() {
      String convertData = response.body;
      int c = 0;
      for (int i = 0; i < convertData.length; i++) {
        if (convertData[i] == '\"') {
          c++;
        }
        if (i > 0) {
          if (convertData[i] == ' ' && convertData[i - 1] == '.') {
            continue;
          }
        }
        if ((c == 3 || c == 4) &&
            convertData[i] != '\\' &&
            convertData[i] != '\"') quote += convertData[i];

        if (c == 4) {
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: blackBlue,
      body: Container(
        padding: EdgeInsets.all(data.size.width * 0.05),
        child: Center(
          child: AutoSizeText(
            '\“' + quote + '\“',
            style: TextStyle(
              color: cyan,
              fontSize: data.size.width * 0.1,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
