import 'package:flutter/material.dart';

class TransportationScreen extends StatelessWidget {
  final String transportation;
  final ValueChanged<String> onTransportationChanged;

  TransportationScreen({required this.transportation, required this.onTransportationChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('What is your preferred mode of transportation?', style: TextStyle(fontSize: 24, color: Colors.white)),
        DropdownButton<String>(
          value: transportation,
          onChanged: (value) => onTransportationChanged(value!),
          items: ['Rental car', 'Public transport', 'Cycling', 'Walking']
              .map((transport) => DropdownMenuItem(
                    value: transport,
                    child: Text(transport, style: TextStyle(color: Colors.white)),
                  ))
              .toList(),
              dropdownColor: Colors.transparent,
        ),
      ],
    );
  }
}
