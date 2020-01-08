import 'package:flutter/material.dart';

class RxDartDemo extends StatefulWidget {
  @override
  RxDartDemoState createState() => new RxDartDemoState();
}

class RxDartDemoState extends State<RxDartDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(RxDartDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 300,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                            child: Text(
                          'Dxdart Demo',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                        )))),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    "00",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {
                          //time 1 press
                        },
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {},
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {},
                        child: Text('Resume'),
                      ),
                    ],
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    "00",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {
                          //time 2 press
                        },
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {},
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {},
                        child: Text('Resume'),
                      ),
                    ],
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    "00",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {
                          //time3 press
                        },
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {},
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {},
                        child: Text('Resume'),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
