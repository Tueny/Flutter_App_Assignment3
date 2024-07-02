import 'package:flutter/material.dart';
import 'theme_service.dart';

class HomeScreen extends StatelessWidget {
  final ThemeService themeService;

  HomeScreen({required this.themeService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
