import 'package:todo_list/domain/model/task.dart';
import 'package:todo_list/domain/repository/tasks_repository.dart';

/// We provide  [Task] object as argument for methods [delete],
/// [markAsComplete] and other operations with existing tasks
/// in case API logic will be changed later
abstract interface class TasksInteractor {
  Future<List<Task>> fetchAllTasks();

  Future<void> add({required String title});

  Future<void> delete({required Task task});

  Future<void> markAsComplete({required Task task});
}

final class TasksInteractorImpl implements TasksInteractor {
  final TasksRepository _repository;

  TasksInteractorImpl(this._repository);

  @override
  Future<void> add({required String title}) {
    return _repository.addTask(title: title);
  }

  @override
  Future<void> delete({required Task task}) {
    return _repository.deleteTask(task.url);
  }

  @override
  Future<List<Task>> fetchAllTasks() {
    return _repository.getAllTasks();
  }

  @override
  Future<void> markAsComplete({required Task task}) {
    return _repository.updateTask(
      url: task.url,
      completeness: true,
    );
  }
}
