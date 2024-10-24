import 'package:flutter/material.dart';

import '../main.dart';

void main() => runApp(MyApp());

class BookingAppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Center(
        child: Text('This is the Chat Page.'),
      ),
    );
  }
}