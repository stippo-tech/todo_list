import 'package:auto_route/auto_route.dart';
import 'package:todo_list/presentation/screens/auth/auth_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
      ];
}
