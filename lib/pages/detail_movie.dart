import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailMoviePage extends StatelessWidget {
  final String title,
      desc,
      releaseDate,
      imagePath,
      imageBackground,
      popularity,
      language;
  const DetailMoviePage(
      {required this.title,
      required this.desc,
      required this.language,
      required this.popularity,
      required this.imagePath,
      required this.imageBackground,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18162E),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageBackground),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Color(0xFF1D1C3B),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Release date: " + releaseDate,
                                  style: TextStyle(color: Color(0xFF4F4F6B)),
                                ),
                                Text(
                                  "language: " + language,
                                  style: TextStyle(color: Color(0xFF4F4F6B)),
                                ),
                                Text(
                                  "popularity: " + popularity,
                                  style: TextStyle(color: Color(0xFF4F4F6B)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          child: Text(
                            "9.0",
                            style: TextStyle(
                                color: Color(0xFFE7C54D),
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Color(0xFF1D1C3B),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description:",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            desc,
                            style: TextStyle(color: Color(0xFFB2B2B2)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 20),
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Container(
    //             margin: EdgeInsets.only(top: 30),
    //             width: 100,
    //             height: 150,
    //             child: Image(
    //               image: NetworkImage(imagePath),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Text(
    //             title,
    //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //           Column(
    //             children: [
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Text(
    //                 desc,
    //                 style: TextStyle(color: Colors.black, fontSize: 16),
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Text(releaseDate),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
