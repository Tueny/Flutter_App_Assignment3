import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  void initialize(BuildContext context) {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final hasInternet = result != ConnectivityResult.none;
      final message = hasInternet ? "Connected to Internet" : "Disconnected from Internet";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    });
  }
}
