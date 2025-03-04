import 'package:abhishekrexmedia/views/explore_gigs.dart';
import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentsGigs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}
class Myname extends StatelessWidget {
  const Myname({super.key});

  @override
  Widget build(BuildContext context) {
    return ExploreGigs();
  }
}