import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie.dart';
import 'detail_screen.dart';
import 'admin_screen.dart';

class CatalogScreen extends StatelessWidget {

  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        backgroundColor:
        Colors.lightBlueAccent,

        title: const Text(

          "Catálogo MovieFlix",

          style: TextStyle(
            color: Colors.black,
          ),
        ),

        actions:[

          IconButton(

            icon:const Icon(
              Icons.admin_panel_settings,
              color: Colors.black,
            ),

            onPressed:(){

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder:(_)=>
                  const AdminScreen(),

                ),

              );

            },

          )

        ],

      ),

      body: StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance
            .collection("movies")
            .snapshots(),

        builder:(context,snapshot){

          if(snapshot.connectionState==
              ConnectionState.waiting){

            return const Center(
              child:
              CircularProgressIndicator(),
            );

          }

          if(!snapshot.hasData){

            return const Center(

              child:Text(

                "No hay películas",

                style:TextStyle(
                  color:Colors.white,
                ),

              ),

            );

          }

          var docs=snapshot.data!.docs;

          return GridView.builder(

            padding:
            const EdgeInsets.all(15),

            itemCount:
            docs.length,

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount:2,

              crossAxisSpacing:10,

              mainAxisSpacing:10,

              childAspectRatio:.60,

            ),

            itemBuilder:(context,index){

              var data=
              docs[index];

              Movie movie=
              Movie(

                title:data["title"]??"",
                year:data["year"]??"",
                director:data["director"]??"",
                genre:data["genre"]??"",
                synopsis:data["synopsis"]??"",
                image:data["image"]??"",
              );

              return GestureDetector(

                onTap:(){

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(_)=>

                      DetailScreen(
                        movie:movie,
                      ),

                    ),

                  );

                },

                child:Container(

                  decoration:
                  BoxDecoration(

                    color:
                    Colors.grey[900],

                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                  ),

                  child:Column(

                    children:[

                      Expanded(

                        child:
                        ClipRRect(

                          borderRadius:
                          const BorderRadius.only(

                            topLeft:
                            Radius.circular(20),

                            topRight:
                            Radius.circular(20),

                          ),

                          child:

                          Image.asset(

                            movie.image,

                            width:
                            double.infinity,

                            fit:
                            BoxFit.cover,

                            errorBuilder: 
                            (_, error, stackTrace){

                              return const Icon(

                                Icons.movie,

                                color:
                                Colors.white,

                                size:100,

                              );

                            },

                          ),

                        ),

                      ),

                      Padding(

                        padding:
                        const EdgeInsets.all(8),

                        child:Text(

                          movie.title,

                          textAlign:
                          TextAlign.center,

                          style:
                          const TextStyle(

                            color:
                            Colors.white,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),

                      )

                    ],

                  ),

                ),

              );

            },

          );

        },

      ),

    );

  }

}