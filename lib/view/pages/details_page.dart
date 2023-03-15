import 'package:filmes_app/presenter/details_presenter.dart';
import 'package:filmes_app/presenter/entities/detalhe_filme_entity.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int moveId;
  final DetailsPresenter presenter;
  const DetailsPage(this.moveId, this.presenter, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetalheFilmeEntity? filme;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    analytics.logEvent(name: 'film_detalis');
    widget.presenter.filmDetails(widget.moveId).then((value) {
      filme = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: filme == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    'https://image.tmdb.org/t/p/w500/${filme!.backdropPath}'),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${filme!.overview}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Data de lançamento: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                    children: [
                      TextSpan(
                        text: _buildFormatDatePT(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Produtores: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                    children: [
                      for (var item in filme!.productionCompanies!)
                        TextSpan(
                          text: '${item.name}, ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  String _buildFormatDatePT() {
    final datas = filme!.releaseDate!.split('-');

    return '${datas[2]}/${datas[1]}/${datas[0]}';
  }
}
