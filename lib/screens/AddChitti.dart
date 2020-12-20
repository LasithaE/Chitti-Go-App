import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chitti/screens/Users.dart';
import 'package:firebase_database/firebase_database.dart';

class AddChitti extends StatefulWidget {
  final name;
  final uid;

  AddChitti({this.name, this.uid});
  @override
  _AddChittiState createState() => _AddChittiState();
}

var userD = '';

class _AddChittiState extends State<AddChitti> {
  FirebaseUser user;
  Future<String> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    final userD = userData.uid.toString();
    return userD;
  }

  //Future Stream<DataSnapshot> getUserData() async {
  //      userD =
  //      return userCollection
  //          .doc(FirebaseAuth.instance.currentUser.uid)
  //      .collection("chittis")
  //      .snapshots();
  //}
  List<Chitti> chittiList = [];
  @override
  void initState() {
    super.initState();
    @override
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    ref.once().then((DataSnapshot snapshot) async {
      var userd = await getUserData();
      print(userd);

      var KEYS = snapshot.value["Chittis"]["Chitti 1"].keys;
      print(KEYS);
      var KEYS1 = snapshot.value["Chittis"].keys;
      print(KEYS1);
      var DATA = snapshot.value["Users"][userd];
      var KEYS2 = snapshot.value["Users"][userd].keys;
      if (KEYS2.contains('chittis')) {
        var DATA = snapshot.value["Users"][userd]['chitti'];
      } else {
        var DATA = snapshot.value["Users"][userd]['chittis'];
      }
      //var DATA = snapshot.value["Users"];
      print(DATA);

      var CHITTI_INFO = snapshot.value["Chittis"];
      print(CHITTI_INFO);

      chittiList.clear();
      if (DATA.length == 1) {
        for (var key in KEYS1) {
          Chitti chitti = new Chitti(
              CHITTI_INFO[key]['chitti_amount'],
              CHITTI_INFO[key]['chitti_name'],
              CHITTI_INFO[key]['due_this_month'],
              CHITTI_INFO[key]['last_bid_by'],
              CHITTI_INFO[key]['next_bid_on'],
              CHITTI_INFO[key]['next_bid_time']);
          chittiList.add(chitti);
        }
      } else {
        for (var key in KEYS1) {
          if (DATA.contains(key) == false) {
            Chitti chitti = new Chitti(
                CHITTI_INFO[key]['chitti_amount'],
                CHITTI_INFO[key]['chitti_name'],
                CHITTI_INFO[key]['due_this_month'],
                CHITTI_INFO[key]['last_bid_by'],
                CHITTI_INFO[key]['next_bid_on'],
                CHITTI_INFO[key]['next_bid_time']);
            chittiList.add(chitti);
          }
        }
      }

      setState(() {
        print(chittiList);
        print('Length : ${chittiList.length}');
        print('${chittiList[0]}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: chittiList.length == 0
              ? new Text('No data is available')
              : new ListView.builder(
                  itemCount: chittiList.length,
                  itemBuilder: (_, index) {
                    return Chiiti_UI(
                      chittiList[index].chitti_amount,
                      chittiList[index].chitti_name,
                      chittiList[index].due_this_month,
                      chittiList[index].last_bid_by,
                      chittiList[index].next_bid_on,
                      chittiList[index].next_bid_time,
                    );
                  },
                )),
    );
  }

  Widget Chiiti_UI(int chitti_amount, String chitti_name, int due_this_month,
      String last_bid_by, String next_bid_on, String next_bid_time) {
    return GestureDetector(
      onTap: () {
        return showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 500,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: new Text(
                              chitti_name != null ? chitti_name : 'chitti1',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Text(
                                  "Chitti Amount : ",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  'Rs.${chitti_amount != null ? chitti_amount : 0}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
                                  "Due each Month : ",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  'Rs.${due_this_month != null ? due_this_month : 0}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
                                  "Next Bid On :",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  next_bid_on != null ? next_bid_on : 0,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
                                  "Next Bid at :",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Text(
                                  next_bid_time != null ? next_bid_time : 0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                  "Last bid by :",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Text(
                                  last_bid_by != null ? last_bid_by : 0,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                width: 200,
                                height: 100,
                                child: FlatButton(
                                  color: Colors.blue,
                                  child: Text("Add this chitti",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16)),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(16),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              );
            });
      },
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(30.0),
        child: new Container(
          padding: new EdgeInsets.all(14.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: new Text(
                    chitti_name != null ? chitti_name : 'chitti1',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "ChittiAmount",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Rs.${chitti_amount != null ? chitti_amount : 0}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
