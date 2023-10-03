import 'package:get_it/get_it.dart';
import 'package:todo_list/data/repository/tasks_repository_impl.dart';
import 'package:todo_list/domain/interactors/tasks_interactor.dart';
import 'package:todo_list/domain/repository/tasks_repository.dart';

part 'init_interactors.dart';
part 'init_repositories.dart';

void initDi() {
  _initRepositories();
  _initInteractors();
}
