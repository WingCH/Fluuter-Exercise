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

//  void listenStream(StreamSubscription streamSubscription, String position) {
//    if (streamSubscription == null) {
//      setState(() {
//        streamSubscription = timerStream.listen((int data) {
//          switch (position) {
//            case "time_1":
//              time_1 = data;
//              break;
//            case "time_2":
//              time_2 = data;
//              break;
//            case "time_3":
//              time_3 = data;
//              break;
//          }
//        });
//      });
//    } else {
//      streamSubscription.cancel();
//    }
//  }

  void pauseStream(StreamSubscription streamSubscription) {
    //mark sure streamSubscription already listening stream
    if (streamSubscription != null) {
      // pause listen stream if stream is not pausing
      if (!streamSubscription.isPaused) {
        setState(() {
          streamSubscription.pause();
        });
      }
    }
  }

  void resumeStream(StreamSubscription streamSubscription) {
    //mark sure streamSubscription already listening stream
    if (streamSubscription != null) {
      // resume pause stream if stream is pausing
      if (streamSubscription.isPaused) {
        setState(() {
          streamSubscription.resume();
        });
      }
    }
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
                          'StreamSubscription Demo',
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
                          if (streamSubscription1 == null) {
                            streamSubscription1 =
                                timerStream.listen((int data) {
                              setState(() {
                                time_1 = data;
                              });
                            });
                          } else {
                            streamSubscription1.cancel();
                          }
                        },
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: streamSubscription1 != null &&
                                  !streamSubscription1.isPaused
                              ? () => pauseStream(streamSubscription1)
                              : null,
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: streamSubscription1 != null &&
                                streamSubscription1.isPaused
                            ? () => resumeStream(streamSubscription1)
                            : null,
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
                        onPressed: () {
                          if (streamSubscription2 == null) {
                            streamSubscription2 =
                                timerStream.listen((int data) {
                              setState(() {
                                time_2 = data;
                              });
                            });
                          }
                        },
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: streamSubscription2 != null &&
                                  !streamSubscription2.isPaused
                              ? () => pauseStream(streamSubscription2)
                              : null,
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: streamSubscription2 != null &&
                                streamSubscription2.isPaused
                            ? () => resumeStream(streamSubscription2)
                            : null,
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
                          if (streamSubscription3 == null) {
                            streamSubscription3 =
                                timerStream.listen((int data) {
                              setState(() {
                                time_3 = data;
                              });
                            });
                          }
                        },
                        child: Text('Listen'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlineButton(
                          onPressed: streamSubscription3 != null &&
                                  !streamSubscription3.isPaused
                              ? () => pauseStream(streamSubscription3)
                              : null,
                          child: Text('Paused'),
                        ),
                      ),
                      OutlineButton(
                        onPressed: streamSubscription3 != null &&
                                streamSubscription3.isPaused
                            ? () => resumeStream(streamSubscription3)
                            : null,
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
