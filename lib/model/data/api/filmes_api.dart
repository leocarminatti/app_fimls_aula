import 'dart:convert';

import 'package:filmes_app/model/detalhe_filme_model.dart';
import 'package:filmes_app/model/filme_response_model.dart';
import 'package:http/http.dart' as http;

class FilmesApi {
  var client = http.Client();

  Future<FilmeResponseModel> getFilms() async {
    try {
      var response = await client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=b620dd673ac6189f8384775cbe169d63&language=en-US&page=1'));

      Map<String, dynamic> json = jsonDecode(response.body);

      return FilmeResponseModel.fromJson(json);
    } finally {
      client.close();
    }
  }

  Future<DetalheFilmeModel> filmDetails(int moveId) async {
    try {
      var response = await client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$moveId?api_key=b620dd673ac6189f8384775cbe169d63&language=pt-BR'));

      Map<String, dynamic> json = jsonDecode(response.body);

      return DetalheFilmeModel.fromJson(json);
    } finally {
      client.close();
    }
  }
}
