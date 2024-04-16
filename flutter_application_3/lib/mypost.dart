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

    // Imprimir el ID del usuario en la consola
    print('ID del usuario: $userId');

    fetchUserPublications(
        userId); // Llamar a la función para cargar las publicaciones del usuario
  }

  Future<void> fetchUserPublications(int userId) async {
    final response = await http.get(Uri.parse(
        'https://rico.terrabyteco.com/api/publications/user/$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        publications = data.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to load user publications');
    }
  }

  Future<void> _deletePublication(int publicationId) async {
    final response = await http.delete(
      Uri.parse(
          'https://rico.terrabyteco.com/api/publications/delete/$publicationId'),
    );
    if (response.statusCode == 200) {
      // Eliminar la publicación de la lista
      setState(() {
        publications!
            .removeWhere((publication) => publication['id'] == publicationId);
      });
      // Mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Publicación eliminada con éxito'),
        ),
      );
    } else {
      // Mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al eliminar la publicación'),
        ),
      );
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
                final publicationId = publication['id'];
                return Card(
                  child: ListTile(
                    title: Text(publicationTitle.toString()),
                    subtitle: Text(publicationDate.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deletePublication(publicationId);
                      },
                    ),
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
