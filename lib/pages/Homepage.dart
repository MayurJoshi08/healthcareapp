import 'package:flutter/material.dart';
import 'Profilepage.dart';
import 'Schedulepage1.dart';
import 'chatpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  // List of pages to display
  final List<Widget> _pages = <Widget>[
    HomePage(),
    SchedulePage(),
    ChatPage(),
    ProfilePage(),
  ];

  // Method to handle bottom navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 249, 249, 1),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped, // Handle taps
      ),
    );
  }
}

// Define the HomePage with all UI elements
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 98, 255, 0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          foregroundImage: AssetImage("assets/Patient pic.png"),
                          backgroundColor: Colors.red,
                          radius: 40,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome Mr.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(150, 167, 175, 1),
                              ),
                            ),
                            Text(
                              "Rajesh Gupta",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(50, 79, 94, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.06,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 1.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60, // Set the height here
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search doctor or clinic',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Schedule",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(50, 79, 94, 1)),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 98, 255, 1)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ScheduleCard(
                      title: "Dr. Pat Gulipat",
                      subtitle: "Dentist",
                      date: "Sunday, 27 June 2021",
                      time: "08:00am - 10:00am",
                      color: const Color.fromRGBO(1, 81, 255, 0.8),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(
                              doctorName: "Dr. Pat Gulipat",
                              specialty: "Dentist",
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 30),
                    ScheduleCard(
                      title: "Dr. John Doe",
                      subtitle: "Cardiologist",
                      date: "Monday, 28 June 2021",
                      time: "09:00am - 11:00am",
                      color: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(
                              doctorName: "Dr. John Doe",
                              specialty: "Cardiologist",
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 0.3,
                      blurRadius: 40,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Text(
                  "Health Tips",
                  style: TextStyle(
                    color: Color.fromRGBO(50, 79, 94, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final Color color;
  final VoidCallback onTap; // Added onTap callback

  const ScheduleCard({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the onTap when the card is tapped
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage("assets/image.png"),
                      backgroundColor: Colors.red,
                      radius: 30,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Pat Gulipat",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Dentist",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.more_vert, color: Colors.white)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Sunday, 27 June 2021",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_filled, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "08:00am - 10:00am",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  final String doctorName;
  final String specialty;

  BookingPage({required this.doctorName, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Appointment")),
      body: Center(
        child: Text("Booking appointment with $doctorName ($specialty)"),
      ),
    );
  }
}