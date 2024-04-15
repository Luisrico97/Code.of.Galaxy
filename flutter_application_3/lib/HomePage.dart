// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:galaxy/Framework.dart';
import 'package:galaxy/Publications.dart';
import 'package:galaxy/User.dart';
import 'package:galaxy/language.dart';
import 'package:galaxy/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.orange),
        ),
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            _buildCustomInkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Publications()),
                );
              },
              color: const Color.fromARGB(255, 60, 60, 60),
              text: 'Publicacion',
            ),
            _buildCustomInkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Languages()),
                );
              },
              color: const Color.fromARGB(255, 60, 60, 60),
              text: 'Language',
            ),
            _buildCustomInkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Frameworks()),
                );
              },
              color: const Color.fromARGB(255, 60, 60, 60),
              text: 'Framework',
            ),
            _buildCustomInkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Users()),
                );
              },
              color: const Color.fromARGB(255, 60, 60, 60),
              text: 'Users',
            ),
            _buildCustomInkWell(
              onTap: () {
                // Add your action for 'Comment' here
              },
              color: const Color.fromARGB(255, 60, 60, 60),
              text: 'Comment',
            ),
            _buildCustomInkWell(
              onTap: () {
                // Add your action for 'Votes' here
              },
              color: const Color.fromARGB(255, 60, 60, 60),
              text: 'Votes',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCustomInkWell({
  required Function onTap,
  required Color color,
  required String text,
}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
