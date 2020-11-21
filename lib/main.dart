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
  final List<int> total_amount = [
    100000,
    50000,
    200000,
    300000,
    20000,
  ];
  final List<int> members = [
    20,
    10,
  ];
  final List<int> bit = [
    3000,
    1500,
    6000,
    600,
    9000,
  ];
  double total = 100000;
  double auction = 0;
  double mem = 20;
  final List<int> _pay = [
    0,
  ];
  double bit1 = 3000;

  String totalAmount = "100000";
  String membersS = "20";
  String bitS = "3000";
  final auctionamount = TextEditingController();
  final String finalpay = "t";

  void _calculate() {
    auction = double.parse(auctionamount.text);
    if (auctionamount.text.isEmpty || total <= 0 || auction <= 0 || mem <= 0) {
      return;
    }

    double i = auction - bit1;
    print(i);
    double i2 = i / mem;
    _pay.add(((total / mem) - i2).toInt());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                      items: total_amount
                          .map<DropdownMenuItem<String>>((int index) {
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
                          switch (totalAmount) {
                            case "100000":
                              bit1 = bit[0].toDouble();
                              bitS = bit[0].toString();
                              total = total_amount[0].toDouble();
                              break;
                            case "50000":
                              bit1 = bit[1].toDouble();
                              bitS = bit[1].toString();
                              total = total_amount[1].toDouble();
                              break;
                            case "200000":
                              bit1 = bit[2].toDouble();
                              bitS = bit[2].toString();
                              total = total_amount[2].toDouble();
                              break;
                            case "300000":
                              bit1 = bit[4].toDouble();
                              bitS = bit[4].toString();
                              total = total_amount[3].toDouble();
                              break;
                            case "20000":
                              bit1 = bit[3].toDouble();
                              bitS = bit[3].toString();
                              total = total_amount[4].toDouble();
                              break;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Members',
                      style: TextStyle(fontSize: 30, fontFamily: 'Calibri'),
                    ),
                    DropdownButton(
                      elevation: 5,
                      value: membersS,
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                      items: members.map<DropdownMenuItem<String>>((int index) {
                        return DropdownMenuItem(
                          value: index.toString(),
                          child: Text(
                            index.toString(),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          membersS = value;
                          mem = double.parse(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bit',
                      style: TextStyle(fontSize: 30, fontFamily: 'Calibri'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Card(
                        elevation: 3,
                        child: Text(
                          bitS,
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Calibri',
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Auction',
                      style: TextStyle(fontSize: 30, fontFamily: 'Calibri'),
                    ),
                    Card(
                      child: Container(
                        width: 150,
                        child: TextField(
                          controller: auctionamount,
                          decoration: InputDecoration(
                            labelText: 'Auction amount',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        child: FlatButton(
                          onPressed: _calculate,
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                finalpay == null
                    ? SizedBox(height: 10)
                    : Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              _pay.elementAt(_pay.length - 1).toString(),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
