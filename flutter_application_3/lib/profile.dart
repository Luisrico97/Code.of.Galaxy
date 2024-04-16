import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _surname = '';
  String _phone = '';
  String _email = '';
  String _image = '';
  int id = -1;

  bool _isEditing = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _surname = prefs.getString('surname') ?? '';
      _phone = prefs.getString('phone') ?? '';
      _email = prefs.getString('email') ?? '';
      _image = prefs.getString('image') ?? '';
      id = prefs.getInt('id') ?? -1;
    });

    if (id != -1) {
      _fetchUserInfo(id);
    }
  }

  Future<void> _fetchUserInfo(int id) async {
    try {
      var response = await http.get(Uri.parse('https://rico.terrabyteco.com/api/users/item/$id'));
      if (response.statusCode == 200) {
        var userData = json.decode(response.body);
        setState(() {
          _name = userData['name'];
          _surname = userData['surname'];
          _phone = userData['phone'];
          _email = userData['email'];
          _image = userData['image'];
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error al realizar la solicitud HTTP: $e');
    }
  }

  Future<void> _updateUserInfo() async {
    String newName = _nameController.text;
    String newSurname = _surnameController.text;
    String newPhone = _phoneController.text;
    String newEmail = _emailController.text;

    var response = await http.post(
      Uri.parse('https://rico.terrabyteco.com/api/users/update/$id'),
      body: {
        'name': newName,
        'surname': newSurname,
        'phone': newPhone,
        'email': newEmail,
        'image': _image,
      },
    );

    if (response.statusCode == 200) {
      print('Usuario actualizado correctamente');
      // Actualizar los datos en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', newName);
      await prefs.setString('surname', newSurname);
      await prefs.setString('phone', newPhone);
      await prefs.setString('email', newEmail);
      // Actualizar los datos en el estado local
      setState(() {
        _name = newName;
        _surname = newSurname;
        _phone = newPhone;
        _email = newEmail;
        _isEditing = false;
      });
    } else {
      print('Error al actualizar el usuario');
    }
  }

  Future<void> _updateProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      // Realizar la solicitud HTTP para actualizar la imagen del perfil
      var response = await http.post(
        Uri.parse('https://rico.terrabyteco.com/api/users/update/$id'),
        body: {
          'image': base64Image,
        },
      );

      if (response.statusCode == 200) {
        print('Imagen de perfil actualizada correctamente');
        // Actualizar la imagen en el estado local y SharedPreferences
        setState(() {
          _image = base64Image;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('image', base64Image);
      } else {
        print('Error al actualizar la imagen del perfil');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isEditing
                ? TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  )
                : Text(
                    'Name: $_name',
                    style: TextStyle(fontSize: 18.0),
                  ),

            _isEditing
                ? TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(labelText: 'Surname'),
                  )
                : Text(
                    'Surname: $_surname',
                    style: TextStyle(fontSize: 18.0),
                  ),

            _isEditing
                ? TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                  )
                : Text(
                    'Phone: $_phone',
                    style: TextStyle(fontSize: 18.0),
                  ),

            _isEditing
                ? TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  )
                : Text(
                    'Email: $_email',
                    style: TextStyle(fontSize: 18.0),
                  ),

            /*_image.isNotEmpty
                ? CircleAvatar(
                    backgroundImage: MemoryImage(base64Decode(_image)),
                    radius: 50,
                  )
                : SizedBox(),
*/
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                  if (_isEditing) {
                    _nameController.text = _name;
                    _surnameController.text = _surname;
                    _phoneController.text = _phone;
                    _emailController.text = _email;
                  }
                });
              },
              child: Text(_isEditing ? 'Cancelar' : 'Editar'),
            ),

            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  _updateUserInfo();
                },
                child: Text('Guardar Cambios'),
              ),

            /*ElevatedButton(
              onPressed: () {
                _updateProfileImage();
              },
              child: Text('Actualizar Imagen'),
            ),*/
          ],
        ),
      ),
    );
  }
}
