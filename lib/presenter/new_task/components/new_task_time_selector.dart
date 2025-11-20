import 'package:flutter/material.dart';
import 'package:my_task/components/dropdowns/dropdown.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';
import 'package:my_task/utils/formatters/date_formatter.dart';

class NewTaskTimeSelector extends StatefulWidget {
  const NewTaskTimeSelector({
    super.key,
    required this.title,
    required this.selectedTime,
    required this.label,
    required this.onSelected,
  });
  final String title;
  final String selectedTime;
  final void Function(String value) onSelected;
  final String label;

  @override
  State<NewTaskTimeSelector> createState() => _NewTaskTimeSelectorState();
}

class _NewTaskTimeSelectorState extends State<NewTaskTimeSelector> {
  final List<String> times = [];
  @override
  void initState() {
    super.initState();
    setTimes();
  }

  setTimes() {
    DateTime initialDate = DateTime(2025, 01, 01, 00, 00);
    final endDate = DateTime(2025, 01, 02, 00, 00);
    while (initialDate.isBefore(endDate)) {
      final newDate = DateFormatter.toHourMinutes(initialDate);
      times.add(newDate);
      initialDate = initialDate.add(Duration(minutes: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizedBox(height: Responsive.getSizeValue(24));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TaskFontStyle.title.copyWith(color: primaryColor),
        ),

        TaskDropdown(
          label: widget.label,
          selectedItem: widget.selectedTime,
          elements: times,
          width: Responsive.getSizeValue(150),
          onTap: widget.onSelected,
        ),
      ],
    );
  }
}
