import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiVersion = '3';
  String _apiMoviSection = 'movie';  
  String _apiSearchSection = 'search';  
  String _apikey = '6e438a2eff23875035af44551b5e216f';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';  

  int _popularesPage = 0;

  List<Pelicula> _populares = new List();

  bool _cargando = false;

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '$_apiVersion/$_apiMoviSection/now_playing',
        {'api_key': _apikey, 'language': _language });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    
    if (_cargando ) return [];

    _cargando = true;

    _popularesPage++;

    final url = Uri.https(_url, '$_apiVersion/$_apiMoviSection/popular', {
      'api_key': _apikey,
      'language': _language,   
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);

    popularesSink(_populares);

    _cargando = false;

    return resp;
    
  }


  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

   Future<List<Actor>> getReparto(String peliculaId) async {
    final url = Uri.https(_url, '$_apiVersion/$_apiMoviSection/$peliculaId/credits',
        {'api_key': _apikey, 'language': _language });

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final reparto = new Reparto.fromJsonList(decodedData['cast']);

    return reparto.actores;

  }

    Future<List<Pelicula>> buscarPelicula( String query ) async {
    final url = Uri.https(_url, '$_apiVersion/$_apiSearchSection/$_apiMoviSection',
        {'api_key': _apikey,
         'language': _language,
         'query' : query
        });

    return await _procesarRespuesta(url);
  }




}
