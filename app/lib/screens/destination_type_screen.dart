import 'package:flutter/material.dart';

class DestinationTypeScreen extends StatelessWidget {
  final int destinationType;
  final ValueChanged<int> onDestinationChanged;

  DestinationTypeScreen({required this.destinationType, required this.onDestinationChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('According to your inputs, we have some suggested places, Would you like to choose one?', style: TextStyle(fontSize: 24, color: Colors.white)),
        DropdownButton<int>(
          value: destinationType,
          onChanged: (value) => onDestinationChanged(value!),
          items: [0, 1, 2, 3]
              .map((destinations) => DropdownMenuItem(
                    value: destinations,
                    child: Text(destinations == 0 ? 'Egypt' : destinations == 1 ? 'Mauritius' : destinations == 2 ? 'Indonesia' : destinations==3 ? 'South Korea': 'None' , style: TextStyle(color: Colors.white)),
                  ))
              .toList(),
              dropdownColor: Colors.transparent,
        ),
      ],
    );
  }
}
