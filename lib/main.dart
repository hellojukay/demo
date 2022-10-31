import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  inc() {
    n++;
  }

  dec() {
    n--;
  }

  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusableActionDetector(
        autofocus: true,
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.f2): Inc(),
          LogicalKeySet(LogicalKeyboardKey.keyX): Dec()
        },
        actions: {
          Inc: CallbackAction(onInvoke: (intent) {
            print("pressed");
            setState(() {
              inc();
            });
          }),
          Dec: CallbackAction(onInvoke: (intent) {
            print("pressed");

            setState(() {
              dec();
            });
          })
        },
        child: Center(
          child: Text(
            n.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class Inc extends Intent {}

class Dec extends Intent {}
