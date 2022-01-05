import 'package:flutter/material.dart';
import 'package:ecg_monitor/pages/splash_screen.dart';
import 'package:ecg_monitor/pages/ecg_plot.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'EcgPlot':
        return MaterialPageRoute(builder: (_) => EcgPlot());
      // case '/OrdersPage':
      //   return MaterialPageRoute(builder: (_) => Orders());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
