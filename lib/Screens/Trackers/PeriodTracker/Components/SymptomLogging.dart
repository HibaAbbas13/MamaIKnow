
import 'package:flutter/material.dart';

class SymptomLoggingWidget extends StatelessWidget {
  final String selectedSymptom;
  final int selectedSeverity;
  final ValueChanged<String?> onSymptomChanged;
  final ValueChanged<int> onSeverityChanged;

   const SymptomLoggingWidget({super.key, 
    required this.selectedSymptom,
    required this.selectedSeverity,
    required this.onSymptomChanged,
    required this.onSeverityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedSymptom,
          items: ['Cramps', 'Headache', 'Nausea']
              .map((symptom) => DropdownMenuItem<String>(
                    value: symptom,
                    child: Text(symptom),
                  ))
              .toList(),
          onChanged: onSymptomChanged,
        ),
        Row(
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: () => onSeverityChanged(index + 1),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                padding: EdgeInsets.all(8),
                color:
                    index + 1 == selectedSeverity ? Colors.green : Colors.grey,
                child: Text((index + 1).toString()),
              ),
            );
          }),
        ),
      ],
    );
  }
}
