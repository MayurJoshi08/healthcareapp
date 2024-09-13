import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Import your login page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare App', // Optional: Add a title for your app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Optional: Define your theme
      ),
      home: LoginPage(), // Set LoginPage as the home widget
    );
  }
}
