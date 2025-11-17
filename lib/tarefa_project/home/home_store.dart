import 'package:mobx/mobx.dart';
import 'package:my_task/utils/formatters/date_formatter.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  DateTime? selectedDay;
  @observable
  List<DateTime> days = [];
  ///////////////////// GET /////////////////////////

  @action
  String getDayLetter(DateTime date) {
    final letter = DateFormatter().dayLetter(date);
    return letter;
  }

  @action
  void setSelectedDay(DateTime newSelectedDay) {
    selectedDay = newSelectedDay;
  }
}
