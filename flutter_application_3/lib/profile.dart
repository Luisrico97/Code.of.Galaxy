// ProfilePage.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('username') ?? '';
      _surname = prefs.getString('surname') ?? '';
      _phone = prefs.getString('phone') ?? '';
      _email = prefs.getString('email') ?? '';
      _image = prefs.getString('image') ?? '';
    });
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
            Text(
              'Name: $_name',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Surname: $_surname',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Phone: $_phone',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Email: $_email',
              style: TextStyle(fontSize: 18.0),
            ),
            // Mostrar la imagen del perfil si se ha almacenado
            _image.isNotEmpty
                ? Image.network(_image)
                : SizedBox(), // Opcionalmente, puedes mostrar una imagen por defecto aquí
          ],
        ),
      ),
    );
  }
}
