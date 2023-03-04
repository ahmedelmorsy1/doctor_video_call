import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome',textAlign: TextAlign.center,)),
      backgroundColor: Colors.greenAccent,
      body:child
    );
  }
}