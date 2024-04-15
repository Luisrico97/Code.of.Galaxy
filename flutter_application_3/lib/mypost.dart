import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyPost extends StatefulWidget {
  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  List<Map<String, dynamic>>? publications;
  late int userId; // Variable para almacenar el ID del usuario

  @override
  void initState() {
    super.initState();
    _getUserIdFromSharedPreferences(); // Obtener el ID del usuario al inicializar
  }

  Future<void> _getUserIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('id') ?? -1;
    });
    fetchUserPublications(
        userId); // Llamar a la función para cargar las publicaciones del usuario
  }

  Future<void> fetchUserPublications(int userId) async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/publications/user/$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        publications = data.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to load user publications');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Post'),
      ),
      body: publications != null
          ? ListView.builder(
              itemCount: publications!.length,
              itemBuilder: (context, index) {
                final publication = publications![index];
                // Manejo del caso en que 'publication' o sus propiedades sean nulas
                final publicationTitle =
                    publication['publication'] ?? 'No title available';
                final publicationDate =
                    publication['created'] ?? 'No date available';
                return Card(
                  child: ListTile(
                    title: Text(publicationTitle.toString()),
                    subtitle: Text(publicationDate.toString()),
                    // Puedes agregar más información de las publicaciones aquí
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
