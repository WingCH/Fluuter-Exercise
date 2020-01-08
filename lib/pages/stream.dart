import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  StreamDemoState createState() => new StreamDemoState();
}

class StreamDemoState extends State<StreamDemo> {
  StreamController<int> streamController;
  StreamSubscription<int> streamSubscription1;
  StreamSubscription<int> streamSubscription2;
  StreamSubscription<int> streamSubscription3;

  int time_1 = 0;
  int time_2 = 0;
  int time_3 = 0;

  bool isDisposed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');

    Duration interval = Duration(seconds: 1);

    Stream<int> timerStream = Stream.periodic(interval, (data) {
      return data;
    }).takeWhile((_) => !isDisposed);

    streamController = StreamController.broadcast();
    streamController.addStream(timerStream, cancelOnError: true);
  }

  @override
  void dispose() {
    print('dispose');
    print(streamSubscription1.toString());
    streamSubscription1?.cancel();
    streamSubscription2?.cancel();
    streamSubscription3?.cancel();
    isDisposed = true;
    super.dispose();

//    streamSubscription1.cancel();
//    streamSubscription2.cancel();
//    streamSubscription3.cancel();
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
                          streamSubscription1 =
                              streamController.stream.listen((data) {
                            setState(() {
                              time_1 = data;
                            });
                          });
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
                          streamSubscription2 =
                              streamController.stream.listen((data) {
                            setState(() {
                              time_2 = data;
                            });
                          });
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
                          streamSubscription3 =
                              streamController.stream.listen((data) {
                            setState(() {
                              time_3 = data;
                            });
                          });
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
