import 'package:flutter/material.dart';
import 'package:todo/home1.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async  {

  await Hive.initFlutter();

  //open box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: HomePage(),
        debugShowCheckedModeBanner: false,
    );
  }
}
