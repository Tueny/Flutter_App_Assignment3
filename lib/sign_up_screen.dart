import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'main.dart';
import 'theme_service.dart';

class SignUpScreen extends StatefulWidget {
  final ThemeService themeService;

  SignUpScreen({required this.themeService});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _authService.signUpWithEmail(
                      _emailController.text,
                      _passwordController.text,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage(themeService: widget.themeService)),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign Up Failed')),
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Image.asset('assets/google_icon.png', height: 24, width: 24),
                label: Text('Sign Up with Google'),
                onPressed: () async {
                  User? user = await _authService.signInWithGoogle();
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage(themeService: widget.themeService)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign Up with Google Failed')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
