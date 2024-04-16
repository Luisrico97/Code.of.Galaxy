import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  late Future<List<Map<String, dynamic>>> _languages;

  @override
  void initState() {
    super.initState();
    _languages = _fetchLanguages();
  }

  Future<List<Map<String, dynamic>>> _fetchLanguages() async {
    final response =
        await http.get(Uri.parse('https://rico.terrabyteco.com/api/languages'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Map<String, dynamic>> languages = [];
      for (var item in jsonData) {
        languages.add({
          'id': item['id'],
          'name': item['name'],
          'created': item['created'],
          'updated': item['updated'],
        });
      }
      return languages;
    } else {
      throw Exception('Failed to load languages');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _languages,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Map<String, dynamic>> languages = snapshot.data!;
            return ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                final name = language['name'] ??
                    'Unknown'; // Comprobación para evitar valores nulos
                final created = language['created'] ?? '';
                return ListTile(
                  title: Text(name),
                  subtitle: Text('Created: $created'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
