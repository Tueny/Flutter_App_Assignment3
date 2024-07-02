import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth_service.dart';
import 'theme_service.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final themeService = ThemeService();
  await themeService.initialize();
  runApp(MyApp(themeService: themeService));
}

class MyApp extends StatelessWidget {
  final ThemeService themeService;

  MyApp({required this.themeService});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeService,
      builder: (context, _) {
        return MaterialApp(
          themeMode: themeService.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          home: MainPage(themeService: themeService),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  final ThemeService themeService;

  MainPage({required this.themeService});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final AuthService _authService = AuthService();
  final Connectivity _connectivity = Connectivity();
  final Battery _battery = Battery();
  String _connectionStatus = 'Unknown';
  int _batteryLevel = -1;

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      final level = await _battery.batteryLevel;
      setState(() {
        _batteryLevel = level;
      });
      if (state == BatteryState.charging && level >= 90) {
        Fluttertoast.showToast(msg: 'Battery is at $level% and charging.');
      }
    });
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _connectionStatus = result.toString();
    });
    Fluttertoast.showToast(msg: 'Connectivity Status: $_connectionStatus');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tueny Mobile App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Navigation'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen(themeService: widget.themeService)),
                );
              },
            ),
            ListTile(
              title: Text('Sign Up'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen(themeService: widget.themeService)),
                );
              },
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: widget.themeService.isDarkMode(),
              onChanged: (value) {
                widget.themeService.setDarkMode(value);
                setState(() {});
              },
            ),
            ListTile(
              title: Text('Connectivity: $_connectionStatus'),
            ),
            ListTile(
              title: Text('Battery Level: $_batteryLevel%'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to Tueny Mobile App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
