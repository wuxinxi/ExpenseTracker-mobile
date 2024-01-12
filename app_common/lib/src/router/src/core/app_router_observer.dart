import 'package:flutter/material.dart';
import 'app_router.dart';

///
/// @date: 2022/5/17 17:28
/// @author: Sensi
/// @remark:
///
class AppRouteObserver<R extends Route<dynamic>> extends RouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final path = route.settings.name;
    if (path != null) AppRouter.routerStack[path] = RouteEntity(path, route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    final path = route.settings.name;
    if (path != null) AppRouter.routerStack.remove(path);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    final path = route.settings.name;
    if (path != null) AppRouter.routerStack.remove(path);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    final oldPath = oldRoute?.settings.name;
    if (oldPath != null) AppRouter.routerStack.remove(oldPath);

    final path = newRoute?.settings.name;
    if (path != null) AppRouter.routerStack[path] = RouteEntity(path, newRoute);
  }
}

class RouteEntity {
  String name;
  Route? route;

  RouteEntity(this.name, this.route);
}
