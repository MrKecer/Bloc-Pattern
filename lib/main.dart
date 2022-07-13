import 'package:bloc/screen/lessonCart.dart';
import 'package:bloc/screen/lessonList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc',
      routes: {
        "/": (context) => LessonList(),
        "/cart": (context) => LessonCart(),
      },
      initialRoute: "/",
    );
  }
}
