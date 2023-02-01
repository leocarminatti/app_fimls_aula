import 'package:filmes_app/presenter/home_presenter.dart';
import 'package:filmes_app/view/pages/home_page.dart';
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
      home: HomePage(HomePresenter()),
    );
  }
}
