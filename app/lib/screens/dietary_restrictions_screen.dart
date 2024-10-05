import 'package:flutter/material.dart';

class DietaryRestrictionsScreen extends StatelessWidget {
  final String dietaryRestrictions;
  final ValueChanged<String> onDietaryChanged;

  DietaryRestrictionsScreen({required this.dietaryRestrictions, required this.onDietaryChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Are there any dietary restrictions or preferences?', style: TextStyle(fontSize: 24, color: Colors.white)),
        DropdownButton<String>(
          value: dietaryRestrictions,
          onChanged: (value) => onDietaryChanged(value!),
          items: ['Vegetarian', 'Vegan', 'Gluten-free', 'No restrictions', 'Other']
              .map((restriction) => DropdownMenuItem(
                    value: restriction,
                    child: Text(restriction, style: TextStyle(color: Colors.white)),
                  ))
              .toList(),
              dropdownColor: Colors.transparent,
        ),
      ],
    );
  }
}
