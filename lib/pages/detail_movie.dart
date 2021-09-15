import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailMoviePage extends StatelessWidget {
  final String title, desc, releaseDate, imagePath, imageBackground;
  const DetailMoviePage(
      {required this.title,
      required this.desc,
      required this.imagePath,
      required this.imageBackground,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18162E),
      body: Container(
        child: Column(
          children: [
            Container(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment(0.5, 0),
                      image: NetworkImage(imageBackground),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.15,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [Text("data"), Text("data")],
                    )),
                    Container(
                      child: ,
                    )
                  ],
                ),
              ),
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
