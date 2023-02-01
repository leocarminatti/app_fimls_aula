import 'package:filmes_app/presenter/details_presenter.dart';
import 'package:filmes_app/presenter/entities/filme_entity.dart';
import 'package:filmes_app/presenter/home_presenter.dart';
import 'package:filmes_app/view/pages/details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage(this.presenter, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FilmeEntity> filmes = [];
  @override
  void initState() {
    widget.presenter.getFilms().then((value) {
      filmes = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Lista de filmes populares'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(filmes[index].id!, DetailsPresenter()),
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${filmes[index].backdropPath}'),
                      ),
                      const Text(
                        'Titulo:',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(filmes[index].title!),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Linguagem: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                          children: [
                            TextSpan(
                              text: filmes[index].originalLanguage,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
