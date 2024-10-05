import 'package:flutter/material.dart';

class TripDurationScreen extends StatelessWidget {
  final int tripDuration;
  final ValueChanged<int> onDurationChanged;

  TripDurationScreen({required this.tripDuration, required this.onDurationChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('What is the duration of your trip?', style: TextStyle(fontSize: 24, color: Colors.white)),
        DropdownButton<int>(
          value: tripDuration,
          onChanged: (value) => onDurationChanged(value!),
          items: [0, 1, 4, 8, 15]
              .map((days) => DropdownMenuItem(
                    value: days,
                    child: Text('$days ${days > 1 ? 'days' : 'day'}', style: TextStyle(color: Colors.white)),
                  ))
              .toList(),
              dropdownColor: Colors.transparent,
        ),
      ],
    );
  }
}
