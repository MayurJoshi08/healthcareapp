import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SchedulePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int selectedDayIndex = 3; // Default selected day index
  int selectedMorningTimeIndex = -1; // No morning time selected initially
  int selectedNightTimeIndex = -1; // No night time selected initially

  final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S'];
  final List<int> dates = [7, 8, 9, 10, 11, 12, 13];
  final List<String> morningTimes = ['08:00 AM', '09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM'];
  final List<String> nightTimes = ['08:00 PM', '09:00 PM', '09:30 PM', '10:00 PM', '10:30 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Appointment'),
        automaticallyImplyLeading: false, // Removes the back arrow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Step 3/5', style: TextStyle(color: Colors.blueAccent)),
            SizedBox(height: 8),
            Text('Select Schedule', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            // Date Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(days.length, (index) {
                return Column(
                  children: [
                    Text(days[index]),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDayIndex = index;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: selectedDayIndex == index ? Colors.blue : Colors.grey[200],
                        child: Text(
                          dates[index].toString(),
                          style: TextStyle(
                            color: selectedDayIndex == index ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 24),
            // Morning Time Slots
            Text('Morning', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: List.generate(morningTimes.length, (index) {
                return ChoiceChip(
                  label: Text(morningTimes[index]),
                  selected: selectedMorningTimeIndex == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedMorningTimeIndex = selected ? index : -1;
                      selectedNightTimeIndex = -1; // Deselect night if morning is selected
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 24),
            // Night Time Slots
            Text('Night', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: List.generate(nightTimes.length, (index) {
                return ChoiceChip(
                  label: Text(nightTimes[index]),
                  selected: selectedNightTimeIndex == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedNightTimeIndex = selected ? index : -1;
                      selectedMorningTimeIndex = -1; // Deselect morning if night is selected
                    });
                  },
                );
              }),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to Medical History Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicalHistoryPage()),
                );
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicalHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Medical History', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your medical history',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Add upload functionality
              },
              icon: Icon(Icons.upload_file, color: Colors.blue),
              label: Text('Upload Prescription', style: TextStyle(color: Colors.blue)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Continue to next step, add necessary action here
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
