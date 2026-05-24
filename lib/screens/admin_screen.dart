import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  final titleController = TextEditingController();
  final yearController = TextEditingController();
  final directorController = TextEditingController();
  final genreController = TextEditingController();
  final synopsisController = TextEditingController();
  final imageController = TextEditingController();

  Future<void> addMovie() async {

    await FirebaseFirestore.instance
        .collection("movies")
        .add({

      "title": titleController.text,
      "year": yearController.text,
      "director": directorController.text,
      "genre": genreController.text,
      "synopsis": synopsisController.text,
      "image": imageController.text,

    });


     if(!mounted) return;
     
     Navigator.pop(context);
     
     }

  Future<void> deleteMovie(String id) async {

    await FirebaseFirestore.instance
        .collection("movies")
        .doc(id)
        .delete();

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Administración"),
        backgroundColor: Colors.lightBlueAccent,
      ),

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.lightBlueAccent,

        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),

        onPressed:(){

          showDialog(

            context: context,

            builder:(context){

              return AlertDialog(

                title: const Text(
                  "Agregar película",
                ),

                content: SingleChildScrollView(

                  child: Column(

                    children:[

                      TextField(
                        controller:titleController,
                        decoration: const InputDecoration(
                          labelText:"Título",
                        ),
                      ),

                      TextField(
                        controller:yearController,
                        decoration: const InputDecoration(
                          labelText:"Año",
                        ),
                      ),

                      TextField(
                        controller:directorController,
                        decoration: const InputDecoration(
                          labelText:"Director",
                        ),
                      ),

                      TextField(
                        controller:genreController,
                        decoration: const InputDecoration(
                          labelText:"Género",
                        ),
                      ),

                      TextField(
                        controller:synopsisController,
                        decoration: const InputDecoration(
                          labelText:"Sinopsis",
                        ),
                      ),

                      TextField(
                        controller:imageController,
                        decoration: const InputDecoration(
                          labelText:"Ruta imagen",
                          hintText:
                          "assets/images/matrix.jpg",
                        ),
                      ),

                    ],

                  ),

                ),

                actions:[

                  ElevatedButton(

                    onPressed:() async {

                      await addMovie();

                    },

                    child: const Text(
                      "Guardar",
                    ),

                  )

                ],

              );

            },

          );

        },

      ),

      body: StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection("movies")
            .snapshots(),

        builder:(context,snapshot){

          if(!snapshot.hasData){

            return const Center(
              child:
              CircularProgressIndicator(),
            );

          }

          var docs=snapshot.data!.docs;

          return ListView.builder(

            itemCount:docs.length,

            itemBuilder:(context,index){

              var movie=docs[index];

              return ListTile(

                leading: const Icon(
                  Icons.movie,
                  color: Colors.white,
                ),

                title: Text(

                  movie["title"],

                  style: const TextStyle(
                    color:Colors.white,
                  ),

                ),

                subtitle: Text(

                  movie["year"],

                  style: const TextStyle(
                    color:Colors.white70,
                  ),

                ),

                trailing: IconButton(

                  icon: const Icon(
                    Icons.delete,
                    color:Colors.red,
                  ),

                  onPressed:() async {

                    await deleteMovie(
                      movie.id,
                    );

                  },

                ),

              );

            },

          );

        },

      ),

    );

  }

}