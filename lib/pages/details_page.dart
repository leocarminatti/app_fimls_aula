import 'package:filmes_app/api/filmes_api.dart';
import 'package:filmes_app/model/detalhe_filme_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int moveId;
  const DetailsPage(this.moveId, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetalheFilmeModel? filme;

  @override
  void initState() {
    FilmesApi().filmDetails(widget.moveId).then((value) {
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
