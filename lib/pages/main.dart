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
            title: Text('Stream'),
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
