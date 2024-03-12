import 'package:flutter/material.dart';

class Framework extends StatelessWidget {
  const Framework({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frameworks'),
      ),
      body: Center(
        child: const Text('Publications Page'),
      ),
    );
  }
}
