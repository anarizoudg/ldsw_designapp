import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'catalog_screen.dart';

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

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        pokemonName = data["name"];

        pokemonImage = data["sprites"]["other"]["official-artwork"]
            ["front_default"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cinema.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Capa oscura
          Container(
            color: Colors.black.withValues(alpha: .70),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "MovieFlix",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Iniciar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Registro",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// CONTENIDO PRINCIPAL
                  Column(
                    children: [
                      const Text(
                        "Bienvenido al catálogo de películas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Aquí podrás explorar nuestras películas favoritas, ver detalles de cada una y disfrutar de su información completa.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// TARJETA DE INFORMACIÓN
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              "Materia: Diseño de aplicaciones móviles",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Nombre: Ana Gabriela Rizo Llaca",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Código: 223983885",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Correo: ana.rizo23b@udgvirtual.udg.mx",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Firebase conectado correctamente",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 20),

                      pokemonImage != ""
                          ? Image.network(
                              pokemonImage,
                              width: 150,
                            )
                          : const CircularProgressIndicator(),

                      const SizedBox(height: 10),

                      Text(
                        pokemonName.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),

                  /// BOTÓN
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        minimumSize: const Size(200, 55),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CatalogScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Ir al catálogo",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}