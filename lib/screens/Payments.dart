import 'package:flutter/material.dart';
import 'package:chitti/screens/PaymentRequest.dart';

class Payments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: <String, WidgetBuilder>{
        //   '/profile': (BuildContext context) => new Profile(),
        // },
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
          body: SafeArea(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [Payment()])),
        ));
  }
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.payment),
                    iconSize: 25,
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  Container(
                    child: Text(
                      "Pay for this month",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentRequest()));
                      },
                      color: Colors.yellow,
                      child: Text(
                        "Pay",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.payment),
                    iconSize: 25,
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  Container(
                    child: Text(
                      "Paid for the month of December 2020",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.payment),
                    iconSize: 25,
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  Container(
                    child: Text(
                      "Paid for the month of December 2020",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.payment),
                    iconSize: 25,
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  Container(
                    child: Text(
                      "Paid for the month of November 2020",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.payment),
                    iconSize: 25,
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  Container(
                    child: Text(
                      "Paid for the month of October 2020",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.payment),
                    iconSize: 25,
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  Container(
                    child: Text(
                      "Paid for the month of September 2020",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Text(
          'You joined this chitti in August 2020 !',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      )
    ]);
  }
}
