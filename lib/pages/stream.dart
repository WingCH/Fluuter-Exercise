import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  StreamDemoState createState() => new StreamDemoState();
}

class StreamDemoState extends State<StreamDemo> {
  Stream<int> timerStream;
  StreamSubscription<int> streamSubscription1;
  StreamSubscription<int> streamSubscription2;
  StreamSubscription<int> streamSubscription3;
  int time_1 = 0;
  int time_2 = 0;
  int time_3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration interval = Duration(seconds: 1);
    timerStream = Stream.periodic(interval, (data) {
      return data;
    }).asBroadcastStream();

    streamSubscription1 = timerStream.listen((int data) {
      setState(() {
        time_1 = data;
      });
    });
    streamSubscription2 = timerStream.listen((int data) {
      setState(() {
        time_2 = data;
      });
    });
    streamSubscription3 = timerStream.listen((int data) {
      setState(() {
        time_3 = data;
      });
    });
//    streamSubscription1 = timerStream.listen(onData)
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
                    time_1.toString(),
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
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {
                            //Pause
                            if (!streamSubscription1.isPaused) {
                              streamSubscription1.pause();
                            }
                          },
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {
                          if (streamSubscription1.isPaused) {
                            streamSubscription1.resume();
                          }
                        },
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
                    time_2.toString(),
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {},
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {
                            if (!streamSubscription2.isPaused) {
                              streamSubscription2.pause();
                            }
                          },
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {
                          if (streamSubscription2.isPaused) {
                            streamSubscription2.resume();
                          }
                        },
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
                    time_3.toString(),
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
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: () {
                            if (!streamSubscription3.isPaused) {
                              streamSubscription3.pause();
                            }
                          },
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {
                          if (streamSubscription3.isPaused) {
                            streamSubscription3.resume();
                          }
                        },
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
