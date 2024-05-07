import 'package:flutter/material.dart';
import 'package:supervisor/features/home/map_track_screen.dart';

class ChooseYourBusScreen extends StatefulWidget {
  const ChooseYourBusScreen({super.key});

  @override
  State<ChooseYourBusScreen> createState() => _ChooseYourBusScreenState();
}

class _ChooseYourBusScreenState extends State<ChooseYourBusScreen> {


  List<String> buses = [
    'Bus 01',
    'Bus 02',
    'Bus 03',
    'Bus 04',
    'Bus 05',

  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.cyan,
        backgroundColor:  Colors.blue.shade500,
        title: const Text(
          'Choose your Bus',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 40.0, left: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: buses.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    title: Text(buses[index]),
                    value: buses[index],
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 250),
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapTrackerScreen(busId: selectedValue),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
