import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'movies_data.dart';

Future<void> uploadInitialMovies() async {

  final collection =
      FirebaseFirestore.instance.collection(
        "movies",
      );

  final snapshot =
      await collection.get();

  // Solo carga si Firebase está vacío
  if(snapshot.docs.isEmpty){

    for(var movie in movies){

      await collection.add({

        "title":movie.title,
        "year":movie.year,
        "director":movie.director,
        "genre":movie.genre,
        "synopsis":movie.synopsis,
        "image":movie.image,

      });

    }

  }

}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options:
    DefaultFirebaseOptions.currentPlatform,

  );

  await uploadInitialMovies();

  runApp(
    const MovieFlixApp(),
  );

}

class MovieFlixApp extends StatelessWidget {

  const MovieFlixApp({
    super.key
  });

  @override
  Widget build(
      BuildContext context
  ){

    return MaterialApp(

      debugShowCheckedModeBanner:false,

      title:'MovieFlix',

      theme:ThemeData.dark(),

      home:
      const HomeScreen(),

    );

  }

}