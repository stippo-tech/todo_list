import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/data/exception/tasks_operation_exception.dart';
import 'package:todo_list/domain/interactors/tasks_interactor.dart';
import 'package:todo_list/domain/model/task.dart';

part 'tasks_state.dart';
part 'tasks_event.dart';
part 'tasks_bloc.freezed.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final _tasksInteractor = GetIt.I.get<TasksInteractor>();

  void _showDefaultError() {
    Fluttertoast.showToast(
      msg: "Something got wrong",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  _init() {
    add(TasksFetchAndUpdate());
  }

  TasksBloc() : super(const TasksState()) {
    on<TasksFetchAndUpdate>((event, emit) async {
      await _tasksInteractor.fetchAllTasks().then(
          (value) => emit(state.copyWith(
                tasks: value,
                fetchingTasks: false,
              )), onError: (e) {
        emit(state.copyWith(fetchingTasks: false));
        if (e is TasksOperationException) {
          _showDefaultError();
        } else {
          throw e;
        }
      });
    });
    on<TasksAddPressed>((event, emit) {
      _tasksInteractor
          .add(title: event.title)
          .onError((error, stackTrace) => _showDefaultError());
      add(TasksFetchAndUpdate());
    });
    on<TasksMarkAsCompletedPressed>((event, emit) {
      _tasksInteractor
          .markAsComplete(task: event.task)
          .then((value) => add(TasksFetchAndUpdate()));
    });
    on<TasksRemovePressed>((event, emit) {
      _tasksInteractor
          .delete(task: event.task)
          .then((value) => add(TasksFetchAndUpdate()));
    });
    on<TasksFilterPressed>((event, emit) {
      emit(state.copyWith(filter: event.filter));
    });

    _init();
  }
}
