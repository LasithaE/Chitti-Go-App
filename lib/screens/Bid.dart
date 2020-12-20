import 'package:flutter/material.dart';
import 'package:chitti/screens/PaymentRecieved.dart';

class Bid extends StatelessWidget {
  @override
  TextEditingController bid_amount = new TextEditingController();

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
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 80),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Bid Activity",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: Text(
                      "Lowest Bid",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: Text(
                      "Rs.4900",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                          child: Text(
                            "Natarajan\n3:00 pm",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    )
                  ]),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: TextField(
                  controller: bid_amount,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      hintText: 'Enter Your Bid'),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: RaisedButton(
                  onPressed: () {
                    final bid = bid_amount.text.toString().trim();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PaymentRecieved()));
                  },
                  color: Colors.yellow,
                  child: Text(
                    "Enter",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
