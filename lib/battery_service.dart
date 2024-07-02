import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BatteryService {
  final Battery _battery = Battery();
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  void initialize(BuildContext context) {
    _batteryStateSubscription = _battery.onBatteryStateChanged.listen((BatteryState state) async {
      if (state == BatteryState.charging) {
        final int batteryLevel = await _battery.batteryLevel;
        if (batteryLevel >= 90) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Battery is 90% or more')));
        }
      }
    });
  }

  void dispose() {
    _batteryStateSubscription?.cancel();
  }
}
