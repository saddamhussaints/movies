import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_movies/components/custom_appbar.dart';
import 'package:my_movies/components/custom_tooltip.dart';
import 'package:my_movies/components/list_dot_item.dart';
import 'package:my_movies/constants/utils.dart';
import 'package:my_movies/models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel? movie;
  final int index;

  const MovieDetailsScreen({Key? key, required this.movie, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section (Image and Title)
              Row(
                children: [
                  // Poster Image
                  Column(
                    children: [
                      Container(
                        width: 320,
                        height: 480,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                          image: DecorationImage(
                            image: NetworkImage('${imageBaseUrl}${movie?.images.backdrops[index].filePath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: 320,
                        decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                        child: Row(
                          children: [
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Available in ${movie?.videos.results[index].site} to Rent or Buy',
                                  style: TextStyle(color: Colors.white),
                                ),
                               const  Text(
                                  'Watch Now',
                                  style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                         "${movie?.videos.results[index].name} (${getYear(movie?.videos.results[index].publishedAt.toString()??"")})",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1), // Border color and width
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Text(
                                'PG',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                             Text("${convertToDdMmYyyy(movie?.videos.results[index].publishedAt.toString()??"")} (IN)"),
                            const SizedBox(
                              width: 10,
                            ),
                             ListDotWiwidget(title: "${movie?.videos.results[index].type}"),
                            const SizedBox(
                              width: 10,
                            ),
                             ListDotWiwidget(title: "Size ${movie?.videos.results[index].size}")
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.black, // Adjust color based on rating
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
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
                            const Text(
                              'User \nScore',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(24)),
                              child: const Text(
                                "What's your Vibe ?",
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CustomToolTip(
                                title: 'Login to create and edit custom lists',
                                icon: Icon(
                                  Icons.list,
                                  color: Colors.white,
                                )),
                            const SizedBox(width: 20),
                            const CustomToolTip(
                                title: 'Login to add movie to favourite list',
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                            const SizedBox(width: 20),
                            const CustomToolTip(
                                title: 'Login to create and edit custom lists',
                                icon: Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                )),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: (){
                                
                              },
                              child:const Row(
                                children: [
                                  Icon(Icons.play_arrow),
                                  Text(
                                    'Play trailer',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 16),
                        const Text(
                          'Things just got a little more despicable.',
                          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 16),
                        // Overview Section
                        const Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                         Text(
                          movie?.overview ??"",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        // Director and Writers
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chris Renaud",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Director",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mike White",
                                  style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.bold,),
                                ),
                                Text(
                                  "Writer",
                                  style: TextStyle(
                                    
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mike White",
                                  style: TextStyle( fontSize: 16,
                                    fontWeight: FontWeight.bold,),
                                ),
                                Text(
                                  "Writer",
                                  style: TextStyle(
                                   
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
