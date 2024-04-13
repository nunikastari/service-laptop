import 'package:flutter/material.dart';

class LocationSelectionScreen extends StatelessWidget {
  final Function(String) onLocationSelected;

  const LocationSelectionScreen({Key? key, required this.onLocationSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Lokasi'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Location 1'),
            onTap: () {
              onLocationSelected('Location 1');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Location 2'),
            onTap: () {
              onLocationSelected('Location 2');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Location 3'),
            onTap: () {
              onLocationSelected('Location 3');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Location 4'),
            onTap: () {
              onLocationSelected('Location 4');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}