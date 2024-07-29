
import 'package:flutter/material.dart';

class MoodLoggingWidget extends StatelessWidget {
  final String selectedMood;
  final TextEditingController notesController;
  final ValueChanged<String?> onMoodChanged;

  MoodLoggingWidget({
    required this.selectedMood,
    required this.notesController,
    required this.onMoodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedMood,
          items: ['Happy', 'Sad', 'Neutral']
              .map((mood) => DropdownMenuItem<String>(
                    value: mood,
                    child: Text(mood),
                  ))
              .toList(),
          onChanged: onMoodChanged,
        ),
        TextField(
          controller: notesController,
          decoration: InputDecoration(
            hintText: 'Add Notes',
          ),
        ),
      ],
    );
  }
}
