// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: Center(
        child: const Text('Language Page'),
      ),
    );
  }
}
