import 'package:flutter/material.dart';

class GroupSizeScreen extends StatelessWidget {
  final int groupSize;
  final ValueChanged<int> onGroupSizeChanged;

  GroupSizeScreen({required this.groupSize, required this.onGroupSizeChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('How many people are traveling with you?', style: TextStyle(fontSize: 24, color: Colors.white)),
        DropdownButton<int>(
          value: groupSize,
          iconEnabledColor: Colors.white,
          onChanged: (value) => onGroupSizeChanged(value!),
          items: [0, 1, 2, 3, 4, 5, 6]
              .map((size) => DropdownMenuItem(
                    value: size,
                    child: Text(size == 0 ? 'Solo' : '$size ${size > 1 ? 'people' : 'person'}', style: TextStyle(color: Colors.white)),
                  ))
              .toList(),
          dropdownColor: Colors.transparent,
        ),
      ],
    );
  }
}
