import 'package:flutter/material.dart';

class ZeitplanApp extends StatelessWidget {
  const ZeitplanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        child: Text("Seja bem vindo ao Zeitplan !"),
      )),
    );
  }
}
