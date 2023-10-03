import 'package:get_it/get_it.dart';
import 'package:todo_list/data/repository/tasks_repository_impl.dart';
import 'package:todo_list/domain/interactors/tasks_interactor.dart';
import 'package:todo_list/domain/repository/tasks_repository.dart';
import 'package:todo_list/presentation/router/app_router.dart';

part 'init_interactors.dart';
part 'init_repositories.dart';

void initDi() {
  GetIt.I.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
  _initRepositories();
  _initInteractors();
}
