import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String title;
  final Function(DateTime) onDateSelected;
  const DatePicker({super.key, required this.onDateSelected, required this.title});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  
  Future<void> _selectDate(BuildContext context) async{
    final int year = DateTime.now().year;
    final int month = DateTime.now().month;
    final int days = DateTime.now().day + 30;
    final DateTime? picked = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(year, month, days));

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Center(child: Text(_selectedDate == null ? "Please select a date" : "${_selectedDate!.toLocal()}")),
        ElevatedButton(onPressed: () => _selectDate(context), child: Text(widget.title))
      ],
    );
  }
}