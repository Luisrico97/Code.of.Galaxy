import 'package:flutter/material.dart';

class Publications extends StatefulWidget {
  const Publications({Key? key}) : super(key: key);

  @override
  _PublicationsState createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  String userName = 'John Doe'; // Nombre de usuario estático
  String userPublication = 'This is a sample publication.'; // Texto de la publicación estático
  TextEditingController commentController = TextEditingController(); // Controlador para el campo de texto del comentario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Publicación estática
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User: $userName',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userPublication,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Campo de texto para el comentario
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Write your comment...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            // Botón para comentar
            ElevatedButton(
              onPressed: () {
                // Lógica para publicar el comentario
                String comment = commentController.text;
                // Aquí puedes hacer algo con el comentario, como enviarlo a un servidor o simplemente mostrarlo en la consola
                print('Comment: $comment');
                // Limpia el campo de texto después de comentar
                commentController.clear();
              },
              child: Text('Comment'),
            ),
          ],
        ),
      ),
    );
  }
}
