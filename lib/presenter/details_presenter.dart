import 'package:filmes_app/model/data/api/filmes_api.dart';
import 'package:filmes_app/model/detalhe_filme_model.dart';
import 'package:filmes_app/presenter/entities/detalhe_filme_entity.dart';

class DetailsPresenter {
  final FilmesApi api = FilmesApi();

  DetailsPresenter();

  Future<DetalheFilmeEntity?> filmDetails(int moveId) async {
    final DetalheFilmeModel resultado = await api.filmDetails(moveId);

    if (resultado == null) {
      return null;
    }

    return DetalheFilmeEntity(
      backdropPath: resultado.backdropPath,
      overview: resultado.overview,
      productionCompanies: resultado.productionCompanies!
          .map(
            (e) => ProductionCompaniesEntity(
              id: e.id,
              logoPath: e.logoPath,
              name: e.name,
              originCountry: e.originCountry,
            ),
          )
          .toList(),
      releaseDate: resultado.releaseDate,
    );
  }
}
