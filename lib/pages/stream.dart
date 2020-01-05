import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  StreamDemoState createState() => new StreamDemoState();
}

class StreamDemoState extends State<StreamDemo> {
  StreamController _streamController;
  Stream<int> timerStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration interval = Duration(seconds: 1);
    timerStream = Stream.periodic(interval, (data) {
      return data;
    });

    _streamController = StreamController.broadcast();
    _streamController.addStream(timerStream);

//    StreamSubscription subscription =
//    _streamController.stream.listen((data) => print("$data"));
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
            child: StreamBuilder<Object>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Text(
                          snapshot.data.toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: OutlineButton(
                                onPressed: () {
//                                  _streamController.onPause();
                                },
                                child: Text('Paused'),
                              ),
                            ),
                            OutlineButton(
                              onPressed: null,
                              child: Text('listen'),
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Text('no Date');
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: StreamBuilder<Object>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Text(
                          snapshot.data.toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: OutlineButton(
                                onPressed: () {
                                  _streamController.sink.add(2);
                                },
                                child: Text('Try add'),
                              ),
                            ),
                            OutlineButton(
                              onPressed: null,
                              child: Text('listen'),
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: StreamBuilder<Object>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Text(
                          snapshot.data.toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
    );
  }
}
