import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(G36App());
}

class G36App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G_36 Technologies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
