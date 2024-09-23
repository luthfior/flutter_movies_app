import 'dart:convert';

import 'package:belajar_flutter_1/models/movie_list.dart';
import 'package:http/http.dart' as http;

class MovieListApi {
  static Future<List<MovieList>> getMovieList() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=206fd28a0a55734055fd105733ad71e5&language=en-US&page=1');

    final response = await http.get(url);

    Map data = jsonDecode(response.body);
    print(data);
    List _temp = [];

    for (var i in data["results"]) {
      _temp.add(i);
    }

    return MovieList.movieListFromSnapshot(_temp);
  }
}
