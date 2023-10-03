import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/presentation/di/init_di.dart';
import 'package:todo_list/presentation/router/app_router.dart';

void main() {
  initDi();

  runApp(_TodoListApplication());
}

class _TodoListApplication extends StatelessWidget {
  _TodoListApplication();

  final _appRouter = GetIt.I.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(initialRoutes: [const AuthRoute()]),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
