import 'package:flutter/material.dart';
import 'package:belajar_flutter_1/models/movie_list.dart';
import 'package:belajar_flutter_1/models/movie_list_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieList> _movieList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future<void> getMovies() async {
    _movieList = await MovieListApi.getMovieList();
    setState(() {
      _isLoading = false;
    });
  }

  final List<Color> boxOfficeMovie = [
    Colors.amber,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.pinkAccent
  ];

  final List<String> genres = [
    "Horror",
    "Action",
    "Adventure",
    "Drama",
    "Science Fiction",
    "Romance",
    "Fantasy",
    "Comedy",
    "Thriller",
    "Western",
    "Crime Film",
  ];

  List<Widget> get movieGenres => genres
      .map((genre) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              genre,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 80, 80, 80),
              ),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Hai,",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 100, 100, 100),
                          )),
                      Text("Bagus",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Container(
                    height: 38,
                    width: 175,
                    decoration: const BoxDecoration(
                        color: Color(0xffe5e5e5),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Search  "),
                          Icon(
                            Icons.search,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Box Office Movie",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 98, 98, 98),
              ),
            ),
            const Divider(height: 10),
            SizedBox(
                height: 225,
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: _movieList.length,
                    itemBuilder: (context, index) {
                      final movie = _movieList[index];
                      return Container(
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        child: movie.posterPath.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Center(child: Icon(Icons.movie)),
                      );
                    })),
            const Divider(height: 30),
            SizedBox(
              height: 35,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xffe5e5e5),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(child: movieGenres[index])),
              ),
            ),
            const Divider(height: 30),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      scrollDirection: Axis.vertical,
                      itemCount: _movieList.length,
                      itemBuilder: (context, index) {
                        final movie = _movieList[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130,
                              height: 190,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: movie.posterPath.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Center(child: Icon(Icons.movie)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      movie.releaseDate,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      movie.overview,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Action for Button 1
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(Icons.schedule),
                                              Text('Schedule')
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Action for Button 2
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(Icons
                                                  .local_activity_outlined),
                                              Text('Buy Ticket')
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
