import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ptsganjil202112rpl2ilham17/pages/detail_movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List movies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchMovie();
  }

  fetchMovie() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=f9882f03ebbec0cd3cf99a20006d0a51";
    var response = await http.get(Uri.parse(url));
    // print(response.body)
    if (response.statusCode == 200) {
      var items = jsonDecode(response.body)['results'];
      setState(() {
        movies = items;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        throw Exception('Failed to load Movie');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18162E),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (movies.contains(null) || movies.length < 0 || isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return getCard(movies[index]);
        });
  }

  Widget getCard(item) {
    String title = item['title'];
    String desc = item['overview'];
    String releaseDate = item['release_date'];
    String language = item['original_language'];
    String voteAverage = item['vote_average'].toString();
    String popularity = item['popularity'].toString();
    String imagePath = "https://image.tmdb.org/t/p/w500" + item['poster_path'];
    String imageBackground =
        "https://image.tmdb.org/t/p/w500" + item['backdrop_path'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMoviePage(
                title: title,
                desc: desc,
                releaseDate: releaseDate,
                imagePath: imagePath,
                imageBackground: imageBackground,
                language: language,
                popularity: popularity,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              color: Color(0xFF1D1C3B),
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imagePath),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Release date: " + releaseDate,
                            style: TextStyle(
                                color: Color(0xFF4F4F6B), fontSize: 16),
                          ),
                          Text(
                            "Language: " + language,
                            style: TextStyle(
                                color: Color(0xFF4F4F6B), fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          voteAverage,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE7C54D),
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 25,
                          color: Color(0xFFE7C54D),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget getCard(item) {
  //   String title = item['title'];
  //   String desc = item['overview'];
  //   String releaseDate = item['release_date'];
  //   String imagePath = "https://image.tmdb.org/t/p/w500" + item['poster_path'];
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
  //     child: Card(
  //       color: Color(0xFF1D1C3B),
  //       child: ListTile(
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => DetailMoviePage(
  //                 title: title,
  //                 desc: desc,
  //                 releaseDate: releaseDate,
  //                 imagePath: imagePath,
  //               ),
  //             ),
  //           );
  //         },
  //         title: Row(
  //           children: <Widget>[
  //             Container(
  //               width: 150,
  //               height: 150,
  //               child: Image(
  //                 image: NetworkImage(imagePath),
  //               ),
  //             ),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     title,
  //                     style: TextStyle(fontSize: 17, color: Colors.black),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Text(
  //                     releaseDate,
  //                     style: TextStyle(color: Colors.grey),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
