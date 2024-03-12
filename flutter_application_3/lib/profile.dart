import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se carga SharedPreferences, se puede mostrar un indicador de carga
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData) {
          // Si no se puede obtener SharedPreferences, se puede manejar el error aquí
          return Text('Error al cargar el perfil');
        }

        final SharedPreferences prefs = snapshot.data!;
        final String username = prefs.getString('username') ?? '';
        final String email = prefs.getString('email') ?? '';

        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Nombre de Usuario: $username',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Correo electrónico: $email',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Agrega aquí la lógica para editar el perfil
                  },
                  child: Text('Editar perfil'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
