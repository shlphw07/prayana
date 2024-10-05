import 'package:flutter/material.dart';

class AccommodationScreen extends StatelessWidget {
  final String accommodation;
  final ValueChanged<String> onAccommodationChanged;

  AccommodationScreen({required this.accommodation, required this.onAccommodationChanged});

  @override
  // @Data
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('What type of accommodation do you prefer?', style: TextStyle(fontSize: 24, color: Colors.white)),
        RadioListTile<String>(
          title: Text('Budget', style: TextStyle(color: Colors.white)),
          value: 'Budget',
          groupValue: accommodation,
          onChanged: (value) => onAccommodationChanged(value!),
        ),
        RadioListTile<String>(
          title: Text('Mid-range', style: TextStyle(color: Colors.white)),
          value: 'Mid-range',
          groupValue: accommodation,
          onChanged: (value) => onAccommodationChanged(value!),
        ),
        RadioListTile<String>(
          title: Text('Luxury', style: TextStyle(color: Colors.white)),
          value: 'Luxury',
          groupValue: accommodation,
          onChanged: (value) => onAccommodationChanged(value!),
        ),
      ],
    );
  }
}
