import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  StreamDemoState createState() => new StreamDemoState();
}

class StreamDemoState extends State<StreamDemo> {
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
  void didUpdateWidget(StreamDemo oldWidget) {
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
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Stream',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                IconButton(
                  iconSize: 60,
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.teal,
                  ),
                )
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
                      onPressed: null,
                      child: Text('listen'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: OutlineButton(
                        onPressed: null,
                        child: Text('listen'),
                      ),
                    ),
                    OutlineButton(
                      onPressed: null,
                      child: Text('listen'),
                    ),
                  ],
                )
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
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 80),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: null,
                      child: Text('listen'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: OutlineButton(
                        onPressed: null,
                        child: Text('listen'),
                      ),
                    ),
                    OutlineButton(
                      onPressed: null,
                      child: Text('listen'),
                    ),
                  ],
                )
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
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 80),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: null,
                      child: Text('listen'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: OutlineButton(
                        onPressed: null,
                        child: Text('listen'),
                      ),
                    ),
                    OutlineButton(
                      onPressed: null,
                      child: Text('listen'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
