import 'package:flutter/material.dart';

import '../main.dart';

void main() => runApp(MyApp());

class BookingAppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile picture section
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      // Action for changing profile picture
                    },
                    icon: Icon(Icons.camera_alt),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Set up your profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                'Update your profile to connect with your doctor with a better impression',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            // Personal information section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            _buildInfoRow('Name', 'Edward Johnson'),
            _buildInfoRow('Contact Number', '+880 14455 66770'),
            _buildInfoRow('Date of Birth', '01/07/1986'),
            SizedBox(height: 20),
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action for continue button
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with actual image URL
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Action for editing information
            },
          ),
        ],
      ),
    );
  }
}