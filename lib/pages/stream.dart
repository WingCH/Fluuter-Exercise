import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  StreamDemoState createState() => new StreamDemoState();
}

class StreamDemoState extends State<StreamDemo> {
  StreamController _streamController;
  Stream<int> timerStream;
  StreamSubscription<int> streamSubscription1;
  StreamSubscription<int> streamSubscription2;
  StreamSubscription<int> streamSubscription3;
  int time = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration interval = Duration(seconds: 1);
    timerStream = Stream.periodic(interval, (data) {
      return data;
    });

    _streamController = StreamController.broadcast();
//    _streamController.addStream(timerStream);

    streamSubscription3 = timerStream.listen((int data) {
      setState(() {
        time = data;
      });
    });
//    streamSubscription1 = timerStream.listen(onData)
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
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
                        onPressed: () {
                          //listen / resume
                        },
                        child: Text('listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {
                            //Pause
                          },
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: null,
                        child: Text('--'),
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
                        onPressed: null,
                        child: Text('listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {
                            _streamController.sink.add(2);
                          },
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: null,
                        child: Text('---'),
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
                    time.toString(),
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
                          streamSubscription3.resume();
                        },
                        child: Text('listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {
                            streamSubscription3.pause();
                          },
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: null,
                        child: Text('---'),
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
