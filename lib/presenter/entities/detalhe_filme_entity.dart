class DetalheFilmeEntity {
  String? backdropPath;
  String? overview;
  List<ProductionCompaniesEntity>? productionCompanies;
  String? releaseDate;

  DetalheFilmeEntity({
    this.backdropPath,
    this.overview,
    this.productionCompanies,
    this.releaseDate,
  });
}

class ProductionCompaniesEntity {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompaniesEntity(
      {this.id, this.logoPath, this.name, this.originCountry});
}
