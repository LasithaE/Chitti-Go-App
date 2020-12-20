import 'package:flutter/material.dart';

class PaymentRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 35,
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle_rounded),
            iconSize: 35,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        title: Center(
          child: const Text('ChittiGo'),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Thank you ",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "for your payment",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  )),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: new AssetImage('assets/tim.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text(
                      "Amount :",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text(
                      "Rs.500",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Divider(color: Colors.black),
              Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Transaction Details",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "Transaction\nNumber :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "     0A63DKBCSE",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "Transaction\nDate :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "               01-01-21",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "Transaction\nTime:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "             3 : 30 PM",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.yellow,
                  child: Text(
                    "Done",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
