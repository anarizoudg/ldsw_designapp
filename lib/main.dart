import 'package:flutter/material.dart';

void main() {
  runApp(MovieFlixApp());
}

class MovieFlixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieFlix',
      home: Scaffold(
        body: Stack(
          children: [

            // IMAGEN DE FONDO
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cinema.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // CAPA OSCURA PARA MEJORAR VISIBILIDAD
            Container(
              color: Colors.black.withOpacity(0.55),
            ),

            // CONTENIDO PRINCIPAL
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // TÍTULO ARRIBA
                Padding(
                  padding: const EdgeInsets.only(top: 60),
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

                // MENSAJE CENTRAL
                Column(
                  children: [

                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Disfruta la mejor experiencia de cine',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                // BOTONES ABAJO
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
                        child: Center(
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

                      SizedBox(height: 15),

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
                        child: Center(
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
      ),
    );
  }
}