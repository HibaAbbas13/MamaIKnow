import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateChanged;

  const CalendarWidget({super.key, required this.onDateChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? _selectedDate;
  DateTime? _nextPeriodDate;

  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _nextPeriodDate =
            pickedDate.add(Duration(days: 28)); // Typical cycle length
      });
      widget.onDateChanged(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () => _pickDate(context),
          child: const Text('Select Last Period Date'),
        ),
        const SizedBox(height: 16),
        if (_selectedDate != null)
          Text(
            'Last Period Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
            style: const TextStyle(fontSize: 16),
          ),
        if (_nextPeriodDate != null)
          Text(
            'Next Estimated Period Date: ${DateFormat.yMMMd().format(_nextPeriodDate!)}',
            style: const TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
