import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
      .map((genre) => Flexible(
            child: Text(
              genre,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 80, 80, 80),
              ),
            ),
          ))
      .toList();

  final List<Map<String, String>> movieList = [
    {
      "title": "The Lord of the Rings: The Rings of Power",
      "date": "2022",
      "genres": "Adventure, Action, Drama, Fantasy"
    },
    {
      "title": "Deadpool & Wolverine",
      "date": "2024",
      "genres": "Action, Comedy, Science Fiction"
    },
    {
      "title": "A Quiet Place: Day One",
      "date": "2024",
      "genres": "Horror, Thriller, Science Fiction"
    },
    {
      "title": "Kingdom of the Planet of the Apes",
      "date": "2024",
      "genres": "Action, Adventure, Science Fiction"
    },
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  height: 210,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: boxOfficeMovie.length,
                    itemBuilder: (context, index) => Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: boxOfficeMovie[index],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18))),
                    ),
                  )),
              const Divider(height: 30),
              SizedBox(
                height: 35,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: movieGenres.length,
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
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: movieList.length,
                    itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130,
                              height: 180,
                              decoration: BoxDecoration(
                                  color: boxOfficeMovie[index],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18))),
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
                                      movieList[index]["title"] ?? "",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      movieList[index]["date"] ?? "",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      movieList[index]["genres"] ?? "",
                                      overflow: TextOverflow.visible,
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
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
