import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
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
    fetchFeaturedCharacter();
  }

  Future<void> fetchFeaturedCharacter() async {

    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/lucario'),
    );

    if (response.statusCode == 200) {

      final data = json.decode(response.body);

      setState(() {
        pokemonName = data['name'];
        pokemonImage =
        data['sprites']['other']['official-artwork']['front_default'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          // IMAGEN DE FONDO
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cinema.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // CAPA OSCURA
          Container(
            color: Colors.black.withValues(alpha: 0.6),
          ),

          // CONTENIDO PRINCIPAL
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // TÍTULO SUPERIOR
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  'MovieFlix',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              // CONTENIDO CENTRAL
              Column(
                children: [

                  const Text(
                    'Bienvenido',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Explora contenido destacado',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),

                  pokemonImage != ""
                      ? Image.network(
                          pokemonImage,
                          width: 180,
                        )
                      : const CircularProgressIndicator(),

                  const SizedBox(height: 20),

                  Text(
                    pokemonName.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // BOTONES INFERIORES
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  left: 30,
                  right: 30,
                ),

                child: Column(
                  children: [

                    // BOTÓN INICIAR SESIÓN
                    Container(
                      width: double.infinity,
                      height: 55,

                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: const Center(
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // BOTÓN CREAR CUENTA
                    Container(
                      width: double.infinity,
                      height: 55,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),

                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: const Center(
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}