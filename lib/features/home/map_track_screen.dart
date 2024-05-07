import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTrackerScreen extends StatelessWidget {
  final String? busId;

  const MapTrackerScreen({super.key, required this.busId});

  @override
  Widget build(BuildContext context) {
    // Get the current time
    DateTime currentTime = DateTime.now();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        buttonSize: const Size(52.0, 52.0),
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        tooltip: 'Speed Dial',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        direction: SpeedDialDirection.down,
        spacing: 24,
        elevation: 8.0,
        childrenButtonSize: const Size(48.0, 48.0),
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.person),
            backgroundColor: Colors.red,
            label: 'Profile',
            labelStyle: const TextStyle(fontSize: 15.0),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/profile_screen'),
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.move_to_inbox_outlined),
            backgroundColor: Colors.green,
            label: 'Lost Objects',
            labelStyle: const TextStyle(fontSize: 15.0),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/lost_objects_screen'),
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(
              Icons.edit,
            ),
            backgroundColor: Colors.orange,
            label: 'Change Password',
            labelStyle: const TextStyle(fontSize: 15.0),
            onTap: () => Navigator.pushReplacementNamed(
                context, '/change_password_screen'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(31.205753, 29.924526),
                zoom: 14.0,
              ),
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              markers: {
                const Marker(
                  markerId: MarkerId('marker_1'),
                  position: LatLng(31.205753, 29.924526),
                ),
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Stop:${currentTime.hour}:${currentTime.minute}:${currentTime.second}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Bus ID: ${busId ?? ""}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add your logic for Item 1
                Navigator.pop(context); // Close the modal bottom sheet
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your logic for Item 2
                Navigator.pop(context); // Close the modal bottom sheet
              },
            ),
          ],
        );
      },
    );
  }
}
