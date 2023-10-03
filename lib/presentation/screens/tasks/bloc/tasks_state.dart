part of 'tasks_bloc.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState({
    @Default(true) bool fetchingTasks,
    List<Task>? tasks,
    @Default(TasksFilter.all) TasksFilter filter,
  }) = _TasksState;
}

enum TasksFilter {
  all,
  completed,
  unCompleted,
}
