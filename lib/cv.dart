import 'package:flutter/material.dart';

class Mycv extends StatelessWidget {
  const Mycv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child:
            SizedBox(width: 700, child: Image.asset('assets/images/zohai.jpg')),
      ),
    );
  }
}
