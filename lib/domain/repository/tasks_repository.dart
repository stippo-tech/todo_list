import 'package:todo_list/domain/model/task.dart';

abstract interface class TasksRepository {
  Future<List<Task>> getAllTasks();

  Future<void> addTask({required String title});

  Future<void> updateTask({
    required String url,
    bool? completeness,
    String? title,
  });

  Future<void> deleteTask(String url);
}
