import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo List'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/stream');
            },
            title: Text('Timer (Baisc Stream)'),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/rxdart');
            },
            title: Text('Timer (Rxdart)'),
            trailing: Icon(Icons.navigate_next),
          ),

          ListTile(
            onTap: () {},
            title: Text('BottomBar'),
            trailing: Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
