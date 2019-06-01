import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'dart:async';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  static NumberFormat df = new NumberFormat("###.#####");
  Timer t;
  int counter = 0;

  double magnitude = 0;
  String magnitudeStr = "-";
 
  @override
  Widget build(BuildContext context) {
    if (t == null) {
      //crashes even with 50ms, but takes longer
      t = Timer.periodic(Duration(milliseconds: 10), (tt) {
        if (!mounted)
          disposeImpl();
        else {
          //the values in this 3 element vector don't matter
          var event = [21.1, 41.2, 98.1];

          //create a new array, then copy the event values into it.
          var scratchArray = List.filled(3, 0.0);
          scratchArray[0] = event[0];
          scratchArray[1] = event[1];
          scratchArray[2] = event[2];

          //calculate the magnitude of the vector:
          magnitude = Math.sqrt(Math.pow(scratchArray[0], 2) +
              Math.pow(scratchArray[1], 2) +
              Math.pow(scratchArray[2], 2));
          //call NumberFormat.format(any number)
          magnitudeStr = df.format(1.234);
        }
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Wait a few seconds..."),
        ),
        body: Center(child: Text("...")));
  }

  @override
  void dispose() {
    disposeImpl();
    super.dispose();
  }

  void disposeImpl() {
    if (t != null) {
      t.cancel();
      t = null;
    }
  }
}
