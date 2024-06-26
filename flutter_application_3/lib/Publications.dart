// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:galaxy/menu.dart';
import 'package:flutter/material.dart';
import 'package:galaxy/individual_publication.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int id;
  final String name;
  final String surname;

  User({
    required this.id,
    required this.name,
    required this.surname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
    );
  }
}

class Framework {
  final int id;
  final String name;

  Framework({
    required this.id,
    required this.name,
  });

  factory Framework.fromJson(Map<String, dynamic> json) {
    return Framework(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

class Language {
  final int id;
  final String name;

  Language({
    required this.id,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

class Publication {
  final int id;
  final String publication;
  final int
      userId; // Cambia user_id a userId para seguir las convenciones de Dart
  final String created;
  String userName; // Agrega el nombre del usuario

  Publication({
    required this.id,
    required this.publication,
    required this.userId,
    required this.created,
    required this.userName, // Incluye el nombre del usuario en el constructor
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      id: json['id'],
      publication: json['publication'] ?? '',
      userId: json['user_id'],
      created: json['created'] ?? '',
      userName: '', // Inicializa el nombre del usuario como una cadena vacía
    );
  }
}

class Comment {
  final int id;
  final String comment;
  final int userId; // ID del usuario que hizo el comentario
  final String created;
  String userName; // Nombre y apellido del usuario

  Comment({
    required this.id,
    required this.comment,
    required this.userId,
    required this.created,
    required this.userName,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'] ?? '',
      userId: json['user_id'], // Asigna el ID del usuario
      created: json['created'] ?? '',
      userName: '', // Inicializa el nombre del usuario como una cadena vacía
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

class NumberListDialog extends StatelessWidget {
  final List<String> frameworkNames;

  const NumberListDialog({Key? key, required this.frameworkNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Lista de Frameworks'),
      content: SizedBox(
        width: 200.0,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: frameworkNames.length,
          itemBuilder: (context, index) {
            final frameworkName = frameworkNames[index];
            return ListTile(
              title: Text(frameworkName),
              onTap: () {
                Navigator.pop(context,
                    frameworkName); // Retorna el nombre del framework seleccionado cuando se presiona
              },
            );
          },
        ),
      ),
    );
  }
}

class languageListDialog extends StatelessWidget {
  final List<String> languageNames;

  const languageListDialog({Key? key, required this.languageNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Lista de languages'),
      content: SizedBox(
        width: 200.0,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: languageNames.length,
          itemBuilder: (context, index) {
            final languageName = languageNames[index];
            return ListTile(
              title: Text(languageName),
              onTap: () {
                Navigator.pop(context,
                    languageName); // Retorna el nombre del framework seleccionado cuando se presiona
              },
            );
          },
        ),
      ),
    );
  }
}

class _PublicationsState extends State<Publications> {
  late Future<List<Publication>> futurePublications;
  late List<String> frameworkNames = [];
  late List<String> languageNames = [];
  late int userId; // Variable para almacenar el ID del usuario
  TextEditingController searchController = TextEditingController();
  TextEditingController publicationController = TextEditingController();
  bool isVisitor = true;
  String? selectedFramework;
  int?
      selectedFrameworkId; // Variable para almacenar el ID del framework seleccionado
  String? selectedLanguage;
  int?
      selectedLanguageId; // Variable para almacenar el ID del lenguaje seleccionado

  @override
  void initState() {
    super.initState();
    _fetchUserId(); // Llama a la función para obtener el ID del usuario al inicializar el estado
    futurePublications = fetchPublications();
    fetchFrameworkNames();
    fetchLanguageNames();
  }

  List<Publication> filteredPublications(
      List<Publication> publications, String query) {
    return publications.where((publication) {
      final publicationText = publication.publication.toLowerCase();
      final userName = publication.userName
          .toLowerCase(); // Agrega la búsqueda por nombre de usuario
      final searchLower = query.toLowerCase();
      return publicationText.contains(searchLower) ||
          userName.contains(
              searchLower); // Agrega la condición para buscar en el nombre de usuario
    }).toList();
  }

  Future<void> _fetchUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('id') ??
          -1; // Obtiene el ID del usuario almacenado en SharedPreferences
    });
  }

  Future<List<Publication>> fetchPublications() async {
    final url = 'https://rico.terrabyteco.com/api/publications';
    print('Fetching publications from: $url'); // Imprime la URL del endpoint

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      final publications = <Publication>[];

      for (var data in jsonData) {
        final publication = Publication.fromJson(data);
        publication.userName = await fetchUserName(publication.userId);
        publications.add(publication);
      }

      print(
          'Publications data received: $publications'); // Imprime los datos de las publicaciones recibidos

      return publications;
    } else {
      print('Failed to fetch publications: ${response.statusCode}');
      throw Exception('Failed to load publications');
    }
  }

  Future<void> createComment(int publicationId, String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('id') ?? -1;

    try {
      final response = await http.post(
        Uri.parse('https://rico.terrabyteco.com/api/comments/create'),
        body: json.encode({
          'comment': comment,
          'publication_id': publicationId,
          'user_id': userId,
          'date': null,
          'visibility': null,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // Si la solicitud fue exitosa, muestra un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Comment added successfully.'),
        ));

        // Muestra un AlertDialog indicando que el comentario se agregó correctamente
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Comment added successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );

        setState(() {
          futurePublications = fetchPublications();
        });
      } else {
        throw Exception('Failed to add comment: ${response.statusCode}');
      }
    } catch (e) {
      print('Error adding comment: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to add comment. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Función para cargar los nombres de los frameworks desde la API
  Future<void> fetchFrameworkNames() async {
    final response = await http
        .get(Uri.parse('https://rico.terrabyteco.com/api/frameworks'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      setState(() {
        frameworkNames =
            jsonData.map((data) => data['name']).cast<String>().toList();
      });
    } else {
      throw Exception('Failed to load frameworks');
    }
  }

  // Función para cargar los nombres de los frameworks desde la API
  Future<void> fetchLanguageNames() async {
    final response =
        await http.get(Uri.parse('https://rico.terrabyteco.com/api/languages'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      setState(() {
        languageNames =
            jsonData.map((data) => data['name']).cast<String>().toList();
      });
    } else {
      throw Exception('Failed to load frameworks');
    }
  }

  Future<String> fetchUserName(int userId) async {
    final url = 'https://rico.terrabyteco.com/api/users/$userId';
    print('Fetching user data from: $url'); // Imprime la URL del endpoint

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(jsonData);

      print(
          'User data received: $user'); // Imprime los datos del usuario recibidos

      return '${user.name} ${user.surname}';
    } else {
      print('Failed to fetch user data: ${response.statusCode}');
      throw Exception('Failed to load user');
    }
  }

  Future<void> createPublication(String publication) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('id') ??
        -1; // Obtener el ID del usuario almacenado en SharedPreferences

    // Impresión de los datos que se enviarán a la API
    print('Creating new publication:');
    print('Publication: $publication');
    print('Selected Framework ID: $selectedFrameworkId');
    print('Selected Language ID: $selectedLanguageId');
    print('User_ID: $userId');
    print('Comment: null');
    print('Vote_ID: null');
    print('Date: null');
    print('Visibility: null');

    try {
      final response = await http.post(
        Uri.parse(
            'https://rico.terrabyteco.com/api/publications/create'), // Corrige la URL del endpoint
        body: json.encode({
          'publication': publication,
          'comment':
              null, // Asigna el contenido de la publicación al campo de comentario
          'framework_id':
              selectedFrameworkId, // Utiliza el ID del framework seleccionado
          'language_id':
              selectedLanguageId, // Utiliza el ID del lenguaje seleccionado
          'user_id':
              userId, // Utiliza el ID del usuario almacenado en SharedPreferences
          'vote_id': null, // Campo de voto como null
          'date': null, // Campo de fecha como null
          'visibility': null, // Campo de visibilidad como null
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // Cambia el código de estado esperado a 201 para crear correctamente
        // Si la solicitud fue exitosa, recarga las publicaciones para actualizar la lista
        setState(() {
          futurePublications = fetchPublications();
        });
      } else {
        throw Exception('Failed to create publication: ${response.statusCode}');
      }
    } catch (e) {
      // Captura cualquier excepción que ocurra durante la solicitud HTTP
      print('Error creating publication: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content:
              Text('Failed to create publication. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<List<Comment>> fetchComments(int publicationId) async {
    final response = await http.get(Uri.parse(
        'https://rico.terrabyteco.com/api/comments/publication/$publicationId'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      final comments = <Comment>[];

      for (var data in jsonData) {
        final comment = Comment.fromJson(data);
        comment.userName = await fetchUserName(
            comment.userId); // Obtén el nombre y apellido del usuario
        comments.add(comment);
      }

      return comments;
    } else {
      throw Exception('No hay comentarios disponibles');
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
            hintText: 'Buscar',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Nueva publicación'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: publicationController,
                        decoration: const InputDecoration(
                            hintText: 'Escribe tu publicación'),
                      ),
                      SizedBox(
                          height:
                              16), // Espacio entre el campo de texto y el botón
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Framework'),
                        value: selectedFramework,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedFramework = newValue!;
                            // Aquí buscamos el ID correspondiente al framework seleccionado
                            selectedFrameworkId = frameworkNames
                                .indexWhere((name) => name == newValue);
                          });
                        },
                        items: frameworkNames.map((String framework) {
                          return DropdownMenuItem<String>(
                            value: framework,
                            child: Text(framework),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Language'),
                        value: selectedLanguage,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLanguage = newValue!;
                            // Aquí buscamos el ID correspondiente al lenguaje seleccionado
                            selectedLanguageId = languageNames
                                .indexWhere((name) => name == newValue);
                          });
                        },
                        items: languageNames.map((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(language),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // Cierra el diálogo sin hacer nada
                            },
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              createPublication(publicationController.text);
                              Navigator.pop(context);
                            },
                            child: Text('Publicar'),
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              16), // Espacio entre los botones y el botón de publicar
                    ],
                  ),
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
            final filteredList =
                filteredPublications(snapshot.data!, searchController.text);
            return SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.8, // Limita al 80% del alto de la pantalla
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final publication = filteredList[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Usuario: ${publication.userName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Publicación:', // Cambia el texto a mostrar como texto normal
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ), // Opcional: agrega negrita al texto
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${publication.publication}'), // Muestra la publicación como texto normal
                            Text('Fecha de creación: ${publication.created}'),
                          ],
                        ),
                        onTap: () {
                          print('Publication ID: ${publication.id}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IndividualPublicationPage(
                                publicationId: publication.id,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 30), // Espacio entre botones

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Comentarios'),
                                    content: SingleChildScrollView(
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        child: FutureBuilder<List<Comment>>(
                                          future: fetchComments(publication
                                              .id), // Pasa el ID de la publicación actual
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                  child: Text(
                                                      'Error loading comments'));
                                            } else if (snapshot.data == null ||
                                                snapshot.data!.isEmpty) {
                                              // Verifica si snapshot.data es nulo o una lista vacía
                                              return Center(
                                                  child: Text(
                                                      'No se encuentras comentarios disponibles'));
                                            } else {
                                              return Column(
                                                children: (snapshot.data!
                                                        as List<Comment>)
                                                    .map((comment) {
                                                  // Asegúrate de que snapshot.data es una lista de comentarios
                                                  return ListTile(
                                                    title: Text(
                                                        'Usuario: ${comment.userName}'),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'Comentarios: ${comment.comment}'),
                                                        Text(
                                                            'Fecha de creación: ${comment.created}'),
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
                                        child: Text('Cerrar'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text('Ver comentarios'),
                            ),
                          ),
                          SizedBox(width: 20), // Espacio entre botones
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    final TextEditingController
                                        commentController =
                                        TextEditingController();
                                    return AlertDialog(
                                      title: Text('Agregar comentario'),
                                      content: TextField(
                                        controller:
                                            commentController, // Controlador para el campo de texto del comentario
                                        decoration: InputDecoration(
                                            hintText: 'Escribir comentario'),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Cierra el diálogo sin hacer nada
                                          },
                                          child: Text('Cancelar'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            String comment =
                                                commentController.text;
                                            if (comment.isNotEmpty) {
                                              // Verifica que el comentario no esté vacío
                                              await createComment(
                                                  publication.id, comment);
                                              Navigator.pop(
                                                  context); // Cierra el diálogo después de agregar el comentario
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Porfavor ingresa un comentario.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                          child: Text('Agregar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('Agregar comentarios'),
                            ),
                          ),
                        ],
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
