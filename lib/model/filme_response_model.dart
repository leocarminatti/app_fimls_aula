import 'package:filmes_app/model/filme_model.dart';

class FilmeResponseModel {
  int? page;
  List<FilmeModel>? results;
  int? totalResults;
  int? totalPages;

  FilmeResponseModel(
      {this.page, this.results, this.totalResults, this.totalPages});

  FilmeResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <FilmeModel>[];
      json['results'].forEach((v) {
        results!.add(FilmeModel.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    return data;
  }
}
