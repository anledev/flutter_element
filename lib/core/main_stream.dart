import 'dart:async';

import 'package:flutter/material.dart';

class MainStream extends StatelessWidget {
  /*
  * 1. Create Stream.
  * 2. Listener Stream.
  * 3. Single subscription or broadcast.
  * 4. Stream transformer.
  * */

  @override
  Widget build(BuildContext context) {
    return FutureWidget();
  }

  /*StreamBuilder*/
  Widget _demoStreamBuilder() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: streamData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Not connected to the Stream or null');
                  case ConnectionState.waiting:
                    return Text('waiting interaction');
                  case ConnectionState.active:
                    return Text(
                      '${snapshot.data}',
                      style: TextStyle(fontSize: 40),
                    );
                  case ConnectionState.done:
                    return Text('Stream has finished');
                  default:
                    return Text('');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Stream<String> streamData() {
    // return null;
    return Stream.periodic(Duration(seconds: 1), (value) {
      return value.toString();
    }).take(10);
  }

  /*StreamBuilder*/

  Widget _demoStream() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          _streamController();
        },
        child: Text("Fetch Data"),
      ),
    );
  }

  /*Stream Controller: start*/
  void _streamController() {
    StreamController<int> controller = StreamController<int>();
    controller.stream.listen((data) {
      print(data.toString());
    });
    controller.sink.add(10);
    controller.sink.add(20);
    print("===================");
    Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
      return value;
    });
    stream
        .transform(StreamTransformer.fromHandlers(handleData: (input, sink) {
          var newValue = input * 1000;
          sink.add(newValue);
        }))
        .take(10)
        .listen((data) {
          print(data.toString());
        }, onDone: () {
          print("Done");
        });
  }

  /*Stream Controller: end*/

  /*Single subscription or broadcast: start*/
  void _streamBroadcast() {
    var data = Future<int>.delayed(Duration(seconds: 1), () {
      return 100;
    });
    Stream<int> stream = Stream<int>.fromFuture(data).asBroadcastStream();
    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });

    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });

    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });
  }

  void _streamSubscription() {
    Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
      return value;
    });
    var subsciption = stream.take(10).listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });
    // Future.delayed(Duration(seconds: 3), (){
    //   subsciption.pause();
    //   print("Pause");
    // });
    Future.delayed(Duration(seconds: 3), () {
      subsciption.pause(Future.delayed(Duration(microseconds: 100), () {
        print("pause");
      }));
    });
    Future.delayed(Duration(seconds: 6), () {
      subsciption.resume();
      print("Resume");
    });
  }

  /*Single subscription or broadcast: end*/

  /*create Stream: start*/
  void _createStreamFromFuture() {
    //1. demo class MainNetwork
    //2. demo
    var data = Future<int>.delayed(Duration(seconds: 1), () {
      return 100;
    });
    Stream<int> stream = Stream<int>.fromFuture(data);
    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });
  }

  void _createStreamFromIterable() {
    var data = Iterable<int>.generate(10, (value) {
      return value * 1000;
    });

    Stream<int> stream = Stream<int>.fromIterable(data);
    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });
  }

  void _createStreamFromTimer() {
    Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
      return value;
    });
    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Done");
    });
  }
/*create Stream: end*/
}

class FutureWidget extends StatefulWidget {
  @override
  _FutureWidgetState createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  StreamController<String> timerStreamController = StreamController<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initStream();
  }

  Stream<String> streamData() {
    // return null;
    return Stream.periodic(Duration(seconds: 1), (value) {
      return value.toString();
    });
  }

  void initStream() {
    Stream.periodic(Duration(seconds: 1), (value) {
      return value;
    }).take(10).listen((data) {
      timerStreamController.sink.add(data.toString());
      if (data == 5) {
        timerStreamController.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: timerStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Not connected to the Stream or null');
                  case ConnectionState.waiting:
                    return Text('waiting interaction');
                  case ConnectionState.active:
                    return Text(
                      '${snapshot.data}',
                      style: TextStyle(fontSize: 40),
                    );
                  case ConnectionState.done:
                    return Text('Stream has finished');
                  default:
                    return Text('');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
