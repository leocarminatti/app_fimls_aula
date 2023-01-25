import 'package:filmes_app/api/filmes_api.dart';
import 'package:filmes_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Filmes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(FilmesApi()),
    );
  }
}
