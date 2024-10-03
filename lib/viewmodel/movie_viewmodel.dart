import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_movies/constants/utils.dart';
import 'package:my_movies/models/movie_model.dart';
import 'package:my_movies/services/api_service.dart';

class MovieViewModel extends ChangeNotifier {
  late MovieModel _movies;
  bool _isLoading = false;

  MovieModel get movies => _movies;
  bool get isLoading => _isLoading;

  void fetchAndSaveResponse() async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await ApiService.dio.get('/3/movie/157336?api_key=${ApiKey}&append_to_response=videos,images');
      if (response.statusCode == 200) {
        _movies = movieModelFromJson(json.encode(response.data));
      }
    } catch (e, Stacktrace) {
      _isLoading = false;
      print("Error occurred: $Stacktrace");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners to update the UI
    }
    notifyListeners();
  }
}
