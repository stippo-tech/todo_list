part of 'tasks_bloc.dart';

@immutable
abstract interface class TasksEvent {}

class TasksFetchAndUpdate implements TasksEvent {}

class TasksAddPressed implements TasksEvent {
  final String title;

  TasksAddPressed(this.title);
}

class TasksRemovePressed implements TasksEvent {
  final Task task;

  TasksRemovePressed(this.task);
}

class TasksMarkAsCompletedPressed implements TasksEvent {
  final Task task;

  TasksMarkAsCompletedPressed(this.task);
}

class TasksFilterPressed implements TasksEvent {
  final TasksFilter filter;

  TasksFilterPressed(this.filter);
}
