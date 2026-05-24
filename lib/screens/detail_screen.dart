import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailScreen extends StatelessWidget {

  final Movie movie;

  const DetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        backgroundColor:
        Colors.lightBlueAccent,

        title: Text(

          movie.title,

          style: const TextStyle(
            color: Colors.black,
          ),

        ),

      ),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children:[

            Image.asset(
              movie.image,
              width:double.infinity,
              fit:BoxFit.cover,
            ),

            Padding(

              padding:
              const EdgeInsets.all(20),

              child:Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children:[

                  Text(

                    movie.title,

                    style:
                    const TextStyle(

                      color:
                      Colors.white,

                      fontSize:30,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                  const SizedBox(
                    height:15,
                  ),

                  Text(
                    "Año: ${movie.year}",
                    style:
                    const TextStyle(
                      color:Colors.white,
                    ),
                  ),

                  Text(
                    "Director: ${movie.director}",
                    style:
                    const TextStyle(
                      color:Colors.white,
                    ),
                  ),

                  Text(
                    "Género: ${movie.genre}",
                    style:
                    const TextStyle(
                      color:Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height:20,
                  ),

                  const Text(

                    "Sinopsis",

                    style:
                    TextStyle(

                      color:
                      Colors.lightBlueAccent,

                      fontSize:24,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                  const SizedBox(
                    height:10,
                  ),

                  Text(

                    movie.synopsis,

                    style:
                    const TextStyle(
                      color:
                      Colors.white70,
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

}