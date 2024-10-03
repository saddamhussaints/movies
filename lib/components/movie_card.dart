import 'package:flutter/material.dart';
import 'package:my_movies/constants/utils.dart';
import 'package:my_movies/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel? movie;
  final int index;

  const MovieCard({Key? key, required this.movie, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Movie Poster
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      '$imageBaseUrl${movie?.images.backdrops[index].filePath}',
                      height: 300, // Adjust to your image height
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  /*const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(Icons.more_vert, color: Colors.white),
                  ),*/
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Text(
                  movie?.videos.results[index].name ??"",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis, // To handle long titles
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  convertToDdMmYyyy(movie?.videos.results[index].publishedAt.toString() ??""),
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.green.shade700, // Adjust color based on rating
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                '${movie?.images.backdrops[index].voteAverage.toStringAsFixed(1)}%', // Display percentage
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
