import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    buildBody(),
    Container(color: Colors.blue,),
    Container(color: Colors.red,),
    Container(color: Colors.amber,),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smartcasb",
      home: Scaffold(
        appBar: SmartcashAppBar(),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: new Text('Dashboard'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.send),
              title: new Text('Send'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_downward),
                title: Text('Receive')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows),
                title: Text('Transactions')
            ),
          ],
        ),
      )
    );
  }

  static Widget buildBody() {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
      color: Colors.amber,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 48.0,
                          height: 48.0,
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                        Spacer(flex: 1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Text("300,00"), Text("Spending")],
                        ),
                        Spacer(flex: 10),
                        Column(
                          children: <Widget>[
                            Icon(Icons.edit),
                            SizedBox(
                              height: 10.0,
                            ),
                            Icon(Icons.credit_card),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Address"),
                            Text("hfiajieasooasfnoafnasof")
                          ],
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Icon(Icons.content_copy),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


class SmartcashAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _SmartcashAppBarState createState() => _SmartcashAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SmartcashAppBarState extends State<SmartcashAppBar> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(20.0, statusBarHeight, 20.0, 10.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("300"),
              Text("R\$ 300,00"),
            ],
          ),
          Spacer(
            flex: 5,
          ),
          Image.network(
              "https://smartcash.cc/wp-content/uploads/2019/03/smartcash_logo_2019_s.png"),
          Spacer(flex: 5),
          Icon(Icons.person),
          Spacer(flex: 1),
          Icon(Icons.exit_to_app),
        ],
      ),
    );
  }
}
