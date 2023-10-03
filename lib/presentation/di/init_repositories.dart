part of 'init_di.dart';

void _initRepositories() {
  GetIt.I.registerSingleton<TasksRepository>(
    TasksRepositoryImpl(),
  );
}
