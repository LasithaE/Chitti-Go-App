import 'package:chitti/screens/ChittiList.dart';
import 'package:flutter/material.dart';
import 'package:chitti/chat/Connections.dart';

class HomeScreen extends StatelessWidget {
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
                  children: [Carousel(), Con(), Activity()])),
        ));
  }
}

class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          )),
    );
  }
}

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      width: 150.0,
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 60),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(50),
          onTap: () {
            print('tapped');
          },
          child: Column(
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('Chitti 1',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Chitti Amount\t:\tRs.5000',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Due this month\t:\tRs.500',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChittiList()));
                  },
                  color: Colors.yellow,
                  child: Text(
                    "View more chittis",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Con extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // scrollDirection: Axis.vertical,
      // shrinkWrap: true,
      children: [
        Container(
          child: const Text(
            'Connections',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
            height: 100,
            child: GridView.count(
              childAspectRatio: 1.0,
              crossAxisCount: 4,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 10.0,
              children: List.generate(choices.length, (index) {
                return Center(
                  child: SelectCard(choice: choices[index]),
                );
              }),
            )),
        Text(
          'Activity',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'John', icon: Icons.account_circle_rounded),
  const Choice(title: 'Chris', icon: Icons.account_circle_rounded),
  const Choice(title: 'Susan', icon: Icons.account_circle_rounded),
  const Choice(title: 'More', icon: Icons.arrow_right),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CircleAvatar(
        radius: 35.0,
        backgroundColor: Colors.yellow,
        child: Center(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(50),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Connections()),
              );
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Icon(choice.icon, size: 50.0, color: Colors.white),
                  ),
                ]),
          ),
        ),
      ),
      Center(
        child: Text(choice.title),
      ),
      SizedBox(
        height: 5.0,
      )
    ]);
  }
}

class Activity extends StatelessWidget {
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: new AssetImage('assets/chris.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "Chris has joined Chitti 1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '4:59 PM',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: new AssetImage('assets/john.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "John has joined Chitti 3",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '4:00 PM',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: new AssetImage('assets/susan.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "Susan has joined Chitti 4",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '3:00 PM',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: new AssetImage('assets/chris.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "Chris has joined Chitti 3",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '2:00 PM',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: new AssetImage('assets/susan.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "Susan has joined Chitti 2",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '1:00 PM',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
