import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndividualPublicationPage extends StatefulWidget {
  final int publicationId;

  const IndividualPublicationPage({Key? key, required this.publicationId}) : super(key: key);

  @override
  _IndividualPublicationPageState createState() => _IndividualPublicationPageState();
}

class _IndividualPublicationPageState extends State<IndividualPublicationPage> {
  late Future<Publication> futurePublication;

  @override
  void initState() {
    super.initState();
    futurePublication = fetchPublication(widget.publicationId);
  }

  Future<Publication> fetchPublication(int id) async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/publications/$id'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Publication.fromJson(jsonData);
    } else {
      throw Exception('Failed to load publication');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publication Details'),
      ),
      body: Center(
        child: FutureBuilder<Publication>(
          future: futurePublication,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: ${snapshot.data!.id}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Publication: ${snapshot.data!.publication}'),
                        SizedBox(height: 8),
                        Text('Date: ${snapshot.data!.date}'),
                        // Mostrar otros atributos según sea necesario
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Text('Dato no válido');
            }
          },
        ),
      ),
    );
  }
}

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
