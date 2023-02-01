import 'package:filmes_app/model/data/api/filmes_api.dart';
import 'package:filmes_app/presenter/entities/filme_entity.dart';

class HomePresenter {
  final FilmesApi api = FilmesApi();

  HomePresenter();

  Future<List<FilmeEntity>> getFilms() async {
    final resultado = await api.getFilms();

    if (resultado.results == null) {
      return [];
    }

    final filmes = resultado.results!
        .map((e) => FilmeEntity(
              id: e.id,
              backdropPath: e.backdropPath,
              originalLanguage: e.originalLanguage,
              title: e.title,
            ))
        .toList();

    return filmes;
  }
}
