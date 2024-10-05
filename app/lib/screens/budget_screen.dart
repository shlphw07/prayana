import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  final double budget;
  final ValueChanged<double> onBudgetChanged;

  BudgetScreen({required this.budget, required this.onBudgetChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('What is your total budget for the trip?', style: TextStyle(fontSize: 24, color: Colors.white)),
        Slider(
          value: budget,
          min: 0,
          max: 200000,
          divisions: 20,
          label: '\₹${budget.round()}',
          onChanged: onBudgetChanged,
        ),
        Text('Budget: \₹${budget.round()}', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
