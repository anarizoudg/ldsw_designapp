import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MovieFlixApp());
}

class MovieFlixApp extends StatelessWidget {

  const MovieFlixApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieFlix',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String pokemonName = "";
  String pokemonImage = "";

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  Future<void> fetchPokemon() async {

    final response = await http.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/lucario',
      ),
    );

    if(response.statusCode==200){

      final data=jsonDecode(response.body);

      setState(() {

        pokemonName=data["name"];

        pokemonImage=data["sprites"]
        ["other"]
        ["official-artwork"]
        ["front_default"];

      });
    }
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      body: Stack(
        children:[

          Container(
            decoration:const BoxDecoration(
              image:DecorationImage(
                image:AssetImage(
                  'assets/cinema.jpg',
                ),
                fit:BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: Colors.black.withValues(
              alpha:.6,
            ),
          ),

          SafeArea(
            child: Column(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children:[

                const Padding(
                  padding: EdgeInsets.only(
                    top:20,
                  ),

                  child: Text(
                    "MovieFlix",

                    style:TextStyle(
                      color:
                      Colors.lightBlueAccent,
                      fontSize:36,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                Column(
                  children:[

                    const Text(
                      "Bienvenido",

                      style:TextStyle(
                        color:Colors.white,
                        fontSize:42,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height:15,
                    ),

                    const Text(
                      "Firebase conectado correctamente",

                      style:TextStyle(
                        color:
                        Colors.white70,
                      ),
                    ),

                    const SizedBox(
                      height:30,
                    ),

                    pokemonImage!=""
                    ?Image.network(
                      pokemonImage,
                      width:180,
                    )
                    :const CircularProgressIndicator(),

                    const SizedBox(
                      height:15,
                    ),

                    Text(

                      pokemonName.toUpperCase(),

                      style:
                      const TextStyle(
                        color:
                        Colors.yellow,
                        fontSize:25,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    )

                  ],
                ),

                Padding(

                  padding:
                  const EdgeInsets.all(30),

                  child:Column(
                    children:[

                      Container(

                        width:double.infinity,
                        height:55,

                        decoration:
                        BoxDecoration(

                          color:
                          Colors.lightBlueAccent,

                          borderRadius:
                          BorderRadius.circular(15),
                        ),

                        child:
                        const Center(

                          child:Text(
                            "Iniciar Sesión",

                            style:
                            TextStyle(
                              color:
                              Colors.black,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height:15,
                      ),

                      Container(

                        width:double.infinity,
                        height:55,

                        decoration:
                        BoxDecoration(

                          border:
                          Border.all(
                            color:
                            Colors.white,
                          ),

                          borderRadius:
                          BorderRadius.circular(15),
                        ),

                        child:
                        const Center(

                          child:Text(
                            "Crear Cuenta",

                            style:
                            TextStyle(
                              color:
                              Colors.white,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}