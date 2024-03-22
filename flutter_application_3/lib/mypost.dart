import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Post'),
      ),
      body: ListView.builder(
        itemCount: 5, // Supongamos que hay 5 publicaciones para mostrar
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Post ${index + 1}'),
              subtitle: Text('Description of post ${index + 1}'),
              // Puedes agregar más información de las publicaciones aquí
            ),
          );
        },
      ),
    );
  }
}
