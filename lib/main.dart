import 'package:flutter/material.dart';

import 'Homepage.dart';

void main() {
  //elle permet de checkez toute les erreurs present

  runApp(const MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStore',
      theme: ThemeData(backgroundColor: Colors.white),
      home: MyHomePage(),
    );
  }
}
