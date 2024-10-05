import 'package:flutter/material.dart';

class InterestsScreen extends StatelessWidget {
  final List<String> interests;
  final Function(String interest, bool isSelected) onInterestChanged;

  InterestsScreen({required this.interests, required this.onInterestChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What are your main interests for this trip? (Choose up to 3)',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        _buildCheckbox('Adventure'),
        _buildCheckbox('Relaxation'),
        _buildCheckbox('Beaches'),
        _buildCheckbox('Mountainous'),
        _buildCheckbox('Night Life'),
        // Add more interests here...
      ],
    );
  }

  Widget _buildCheckbox(String interest) {
    return CheckboxListTile(
      title: Text(
        interest,
        style: TextStyle(fontSize: 24, color: Colors.white), // Set text color to white
      ),
      value: interests.contains(interest),
      onChanged: (value) => onInterestChanged(interest, value!),
      activeColor: Colors.white, 
      checkColor: Colors.black,  
      
    );
  }
}
