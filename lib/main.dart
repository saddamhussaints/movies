import 'package:flutter/material.dart';
import 'package:my_movies/view/movies_view.dart';
import 'package:my_movies/viewmodel/movie_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner : false,
      home: MoviesPage(),
    );
  }
}
