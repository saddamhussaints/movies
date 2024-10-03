import 'package:flutter/material.dart';
import 'package:my_movies/components/custom_appbar.dart';
import 'package:my_movies/components/movie_card.dart';
import 'package:my_movies/view/movie_details_view.dart';
import 'package:my_movies/viewmodel/movie_viewmodel.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final moviesViewModel = Provider.of<MovieViewModel>(context, listen: false);
      moviesViewModel.fetchAndSaveResponse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieViewModel>(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MovieViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (viewModel.movies.videos.results.isEmpty) {
                  return const Center(child: Text('No movies available'));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // Adjust the number of columns
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: 0.63, // Adjust for proper height of movie cards
                  ),
                  itemCount: viewModel.movies.videos.results.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(movie: viewModel.movies, index: index),
                            ),
                          );
                        },
                        child: MovieCard(movie: viewModel.movies, index: index));
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            onPressed: () => movieViewModel.fetchAndSaveResponse(),
            child: const Text(
              'Load Movies',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
