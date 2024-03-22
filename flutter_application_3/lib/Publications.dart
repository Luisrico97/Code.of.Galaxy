// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_3/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/individual_publication.dart';
import 'package:http/http.dart' as http;

class Publication {
  final int id;
  final String publication;
  final String date;

  Publication({
    required this.id,
    required this.publication,
    required this.date,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      id: json['id'],
      publication: json['publication'] ?? '',
      date: json['date'] ?? '',
    );
  }
}

class Comment {
  final int id;
  final String comment;
  final String date;
  final String username; // Agrega el nombre del usuario

  Comment({
    required this.id,
    required this.comment,
    required this.date,
    required this.username, // Actualiza el constructor para incluir el nombre del usuario
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'] ?? '',
      date: json['date'] ?? '',
      username: json['username'] ?? '', // Asigna el valor del nombre del usuario
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Publications(),
    );
  }
}

class Publications extends StatefulWidget {
  const Publications({Key? key}) : super(key: key);

  @override
  _PublicationsState createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  late Future<List<Publication>> futurePublications;
  TextEditingController searchController = TextEditingController();
  TextEditingController publicationController = TextEditingController();
  bool isVisitor = true; // Variable para indicar si el usuario es un visitante o no

  @override
  void initState() {
    super.initState();
    futurePublications = fetchPublications();
  }

  List<Publication> filteredPublications(List<Publication> publications, String query) {
    return publications.where((publication) {
      final publicationText = publication.publication.toLowerCase();
      final searchLower = query.toLowerCase();
      return publicationText.contains(searchLower);
    }).toList();
  }

  Future<List<Publication>> fetchPublications() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/publications'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.map((data) => Publication.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load publications');
    }
  }

  Future<void> createPublication(String publication) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/publications/create'),
      body: json.encode({'publication': publication}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // Si la solicitud fue exitosa, recarga las publicaciones para actualizar la lista
      setState(() {
        futurePublications = fetchPublications();
      });
    } else {
      throw Exception('Failed to create publication');
    }
  }

  Future<List<Comment>> fetchComments(int publicationId) async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/comments/$publicationId'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.map((data) => Comment.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {}); // Actualiza la interfaz cuando cambia el texto
        },
        decoration: InputDecoration(
          hintText: 'Search publications...',
          border: InputBorder.none,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        // Condición para mostrar u ocultar el botón de agregar publicación
        if (!isVisitor)
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Create Publication'),
                  content: TextField(
                    controller: publicationController,
                    decoration: const InputDecoration(hintText: 'Enter your publication...'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        createPublication(publicationController.text);
                        Navigator.pop(context);
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    ),
    drawer: Drawer(
      child: DrawerScreen(),
    ),
    body: FutureBuilder<List<Publication>>(
      future: futurePublications,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final filteredList = filteredPublications(snapshot.data!, searchController.text);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8, // Limita al 80% del alto de la pantalla
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final publication = filteredList[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text('Publication: ${publication.publication}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${publication.date}'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndividualPublicationPage(publicationId: publication.id),
                          ),
                        );
                      },
                    ),
                    ElevatedButton( // Botón para desplegar comentarios
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Comments'),
                            content: SingleChildScrollView(
                              child: SizedBox(
                                width: double.maxFinite,
                                child: FutureBuilder<List<Comment>>(
                                  future: fetchComments(publication.id),
                                  builder: (context, commentSnapshot) {
                                    if (commentSnapshot.connectionState == ConnectionState.waiting) {
                                      return Center(child: CircularProgressIndicator());
                                    } else if (commentSnapshot.hasError) {
                                      return Center(child: Text('Error loading comments'));
                                    } else {
                                      return Column(
                                        children: commentSnapshot.data!.map((comment) {
                                          return ListTile(
                                            title: Text('User: ${comment.username}'),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Comment: ${comment.comment}'),
                                                Text('Date: ${comment.date}'),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('View Comments'),
                    ),
                  ],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
  );
}


}
