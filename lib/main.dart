import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChitFund_Calci',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ChitFund_Calci'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> total_amount = [100000, 50000, 200000, 300000, 20000];

  String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Amount',
                  style: TextStyle(fontSize: 30, fontFamily: 'Calibri'),
                ),
                DropdownButton(
                  elevation: 5,
                  value: totalAmount,
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  style: TextStyle(color: Colors.blue,fontSize: 22),
                  items:
                      total_amount.map<DropdownMenuItem<String>>((int index) {
                    return DropdownMenuItem(
                      value: index.toString(),
                      child: Text(
                        index.toString(),
                      ),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {
                      totalAmount = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
