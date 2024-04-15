import 'package:flutter/material.dart';
import 'package:galaxy/Login.dart';
import 'package:galaxy/profile.dart';
import 'package:galaxy/mypost.dart'; // Importa la pantalla MyPost
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String _userName = '';
  String _userSurname = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? '';
      _userSurname = prefs.getString('surname') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/Group.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _userSurname,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: NewRow(
                      text: 'Profile',
                      icon: Icons.person_outline,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    // Agregar GestureDetector para My Post
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPost()), // Navegar a MyPost
                      );
                    },
                    child: NewRow(
                      text: 'My Post',
                      icon: Icons.error_outline,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Messages',
                    icon: Icons.chat_bubble_outline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Saved',
                    icon: Icons.bookmark_border,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Favorites',
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Hint',
                    icon: Icons.lightbulb_outline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Icon(Icons.logout),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
