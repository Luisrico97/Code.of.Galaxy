import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Frameworks extends StatefulWidget {
  const Frameworks({Key? key}) : super(key: key);

  @override
  _FrameworksState createState() => _FrameworksState();
}

class _FrameworksState extends State<Frameworks> {
  late Future<List<Map<String, dynamic>>> _frameworks;

  @override
  void initState() {
    super.initState();
    _frameworks = _fetchFrameworks();
  }

  Future<List<Map<String, dynamic>>> _fetchFrameworks() async {
    final response = await http
        .get(Uri.parse('https://rico.terrabyteco.com/api/frameworks'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Map<String, dynamic>> frameworks = [];
      for (var item in jsonData) {
        frameworks.add({
          'id': item['id'],
          'name': item['name'],
          'created': item['created'],
          'updated': item['updated'],
        });
      }
      return frameworks;
    } else {
      throw Exception('Failed to load frameworks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frameworks'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _frameworks,
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
            final List<Map<String, dynamic>> frameworks = snapshot.data!;
            return ListView.builder(
              itemCount: frameworks.length,
              itemBuilder: (context, index) {
                final framework = frameworks[index];
                final name = framework['name'] ?? 'Unknown';
                final created = framework['created'] ?? '';
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
