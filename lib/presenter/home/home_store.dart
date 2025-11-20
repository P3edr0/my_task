import 'package:mobx/mobx.dart';
import 'package:my_task/domain/entities/task_entity.dart';
import 'package:my_task/utils/enums/category.dart';
import 'package:my_task/utils/formatters/date_formatter.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  DateTime? selectedDay;
  @observable
  ObservableList<DateTime> days = ObservableList<DateTime>();
  @observable
  ObservableList<TaskEntity> tasks = ObservableList<TaskEntity>();
  final Map<DateTime, List<TaskEntity>> _allTasks = {};
  ///////////////////// GET /////////////////////////

  void startAllTasks() {
    final newTasks = [
      TaskEntity(
        title: 'Ligar para Crish',
        description: 'Falar sobre a contratação de novo dev',
        category: Category.work,
        date: DateTime.now().toLocal(),
        hasCompleted: false,
      ),
      TaskEntity(
        title: 'Falar com Jon',
        description: 'Falar sobre a contratação de novo dev',
        category: Category.family,
        date: DateTime.now().toLocal(),
        hasCompleted: false,
      ),
      TaskEntity(
        title: 'Depositar bônus joão',
        description: '5500 referente a dezembro',
        category: Category.finance,
        date: DateTime.now().toLocal(),
        hasCompleted: false,
      ),
      TaskEntity(
        title: 'Parabenizar Viny',
        description: 'Parabenizar pelos 35 anos de casada',
        category: Category.family,
        date: DateTime.now().toLocal(),
        hasCompleted: false,
      ),
    ];
    final currentDate = DateTime.now().normalize();
    _allTasks.putIfAbsent(currentDate, () => newTasks);
  }

  @action
  String getDayLetter(DateTime date) {
    final letter = DateFormatter().dayLetter(date);
    return letter;
  }

  @action
  void addTask(TaskEntity newTask) {
    final newTaskDay = newTask.date;
    final newTaskDayTasks = _allTasks[newTaskDay];
    if (newTaskDayTasks != null) {
      _allTasks.update(newTaskDay, (dayTasks) => [...dayTasks, newTask]);
    } else {
      _allTasks.putIfAbsent(newTaskDay, () => [newTask]);
    }
  }

  @action
  void setSelectedDay(DateTime newSelectedDay) {
    selectedDay = newSelectedDay;
    final handledCurrentList = _allTasks[selectedDay!] ?? <TaskEntity>[];
    tasks = ObservableList<TaskEntity>.of(handledCurrentList);
  }
}
