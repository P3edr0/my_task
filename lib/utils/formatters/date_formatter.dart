import 'package:my_task/utils/formatters/int_formatter.dart';

class DateFormatter {
  static String toHourMinutes(DateTime date) {
    final hour = date.hour;

    final minute = IntFormatter.toShow(date.minute);
    String complement;
    if (hour > 11) {
      complement = 'PM';
    } else {
      complement = 'AM';
    }
    final handledHour = IntFormatter.toShow(hour);

    return '$handledHour:$minute $complement';
  }
}
