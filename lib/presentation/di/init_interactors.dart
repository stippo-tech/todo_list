part of 'init_di.dart';

void _initInteractors() {
  GetIt.I.registerSingleton<TasksInteractor>(
    TasksInteractorImpl(
      GetIt.I.get(),
    ),
  );
}
