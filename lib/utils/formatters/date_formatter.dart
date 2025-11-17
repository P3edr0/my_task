import 'package:intl/intl.dart';
import 'package:my_task/locale/locale_controller.dart';
import 'package:my_task/utils/formatters/int_formatter.dart';
import 'package:my_task/utils/formatters/string_formatter.dart';

class DateFormatter {
  final _localeProvider = LocaleController.instance();

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

  String dayLetter(DateTime? date) {
    final weekDay = DateFormat(
      'E',
      _localeProvider.locale.languageCode,
    ).format(date!.toLocal());
    final handledWeekDay = weekDay.replaceFirst(
      weekDay[0],
      weekDay[0].toUpperCase(),
    );
    return handledWeekDay;
  }

  String dateResume(DateTime date) {
    final day = IntFormatter.toShow(date.day);
    final weekDay =
        DateFormat(
          "EEEE",
          _localeProvider.locale.languageCode,
        ).format(date).firstLetterUppercase();

    final month =
        DateFormat(
          "MMMM",
          _localeProvider.locale.languageCode,
        ).format(date).firstLetterUppercase();

    return '$weekDay, $day $month';
  }

  static String toDayMonthYear(DateTime date) {
    final day = date.day;
    final month = date.month;
    final year = date.year;

    final handledDay = IntFormatter.toShow(day);

    return '$handledDay/$month/$year';
  }
}

extension Normalize on DateTime {
  DateTime normalize() {
    return DateTime(year, month, day);
  }
}
