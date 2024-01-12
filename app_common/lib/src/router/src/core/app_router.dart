library approuter;

import 'package:app_common/app_common.dart';
import 'package:app_common/src/router/src/core/redirect_interceptor.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bundle/app_bundle.dart';
import 'app_router_observer.dart';
import 'fluro_router.dart' as f;

part '../extensions/app_router_extensions.dart';

///
/// @date: 2022/4/8 12:03
/// @author: TangRen
/// @remark:
///
class _AppRouter extends f.FluroRouter {
  ///bundle and routeSettings only one
  ///Both can use bundle.=>>routeSettings.arguments=bundle

  final Map<String, RouteEntity> _routerStack = {};

  final _modalBottomSheetRoute = '_ModalBottomSheetRoute';

  @override
  Future navigateTo<T extends StateStreamableSource<Object?>>(String path,
      {BuildContext? context,
      bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      Widget? targetPage,
      RedirectInterceptor? interceptor,
      Bundle? bundle,
      T? bloc,
      List<BlocProvider> Function()? blocProvidersFunction,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) async {
    if (await interceptor?.requiresInterception() ?? false) {
      return interceptor!.navigateTo(context ?? Application.context);
    }
    if (targetPage != null && path.isEmpty) {
      path = '/generate/${targetPage.runtimeType.toString()}';
    }
    if (bundle != null) {
      routeSettings = RouteSettings(arguments: bundle, name: path);
    }
    transition ??= TransitionType.inFromRight;
    return super.navigateTo(path,
        context: context,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        targetPage: targetPage,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        bloc: bloc,
        routeSettings: routeSettings);
  }

  @override
  void define(String routePath,
      {required Handler? handler,
      TransitionType? transitionType,
      Duration transitionDuration = f.FluroRouter.defaultTransitionDuration,
      RouteTransitionsBuilder? transitionBuilder}) {
    super.define(routePath,
        transitionType: transitionType,
        handler: handler,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }

  Future<T?> navigateToDialog<T>({
    required String path,
    required WidgetBuilder builder,
    BuildContext? context,
    Bundle? bundle,
    bool barrierDismissible = false,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
  }) async {
    assert(path.isNotEmpty);
    RouteSettings routeSettings = RouteSettings(name: path, arguments: bundle);
    return await showDialog(
        context: context ?? Application.context,
        builder: builder,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        useSafeArea: useSafeArea,
        useRootNavigator: useSafeArea,
        routeSettings: routeSettings);
  }

  Future<T?> navigateToBottomSheet<T extends StateStreamableSource<Object?>>({
    required String path,
    required WidgetBuilder builder,
    BuildContext? context,
    Bundle? bundle,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    T? bloc,
    AnimationController? transitionAnimationController,
  }) async {
    assert(path.isNotEmpty);
    RouteSettings routeSettings = RouteSettings(name: path, arguments: bundle);
    return await showModalBottomSheet(
      context: context ?? Application.context,
      builder: bloc == null
          ? builder
          : (context) {
              return BlocProvider.value(value: bloc, child: builder(context));
            },
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
    );
  }

  ///back home and clear other page
  ///example:Home ->A->B->C:popToHome ->Home
  void popToHome(BuildContext context) {
    popUntil(context, (route) => route.isFirst);
  }

  @override
  void pop<T>({BuildContext? context, T? result}) {
    if (canPop(context ?? Application.context)) {
      super.pop(context: context ?? Application.context, result: result);
    }
  }

  ///Specify the route through the path pop
  _AppRouter popRoute<T>(String path, [T? result]) {
    final routeEntity = Map.of(_routerStack)[path];
    Route? route;
    if (routeEntity != null && (route = routeEntity.route) != null) {
      _didPop(route, result);
    }
    return this;
  }

  ///pop all dialog/BottomSheet
  _AppRouter popAllDialog<T>(BuildContext context, [T? result]) {
    Map.of(_routerStack).forEach((key, value) {
      final route = value.route;
      if (route != null && (route is DialogRoute || route.runtimeType.toString().contains(_modalBottomSheetRoute))) {
        _didPop(route, result);
      }
    });
    return this;
  }

  _didPop<T>(Route? route, T? result) {
    // route?.didPop(result);
    // route?.navigator?.removeRoute(route);
    ///TODO fix Failed assertion: line 5127 pos 12: '!_debugLocked': is not true.
    route?.navigator?.pop(result);
  }

  void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  bool isActive(String path) {
    return _routerStack[path]?.route?.isActive ?? false;
  }

  /// Whether this route is the top-most route on the navigator.
  ///
  /// If this is true, then [isActive] is also true.
  /// If this is false, maybe  [isActive] is  true or false.
  /// If there is a dialog on this page, then this page is also invisible, the value is false
  /// mark by ShiMing
  bool isCurrent(String path) {
    return _routerStack[path]?.route?.isCurrent ?? false;
  }

  bool hasRoute(String path) {
    return _routerStack[path] != null;
  }

  ///contain dialog、BottomSheet

  bool dialogOpened() {
    return _routerStack.entries.any((e) => e.value.route != null && _isDialogPath(e));
  }

  Map<String, RouteEntity> get routerStack => _routerStack;

  ///When nested use
  _AppRouter createNewAppRouter() => _AppRouter();

  _isDialogPath(MapEntry<String, RouteEntity> e) {
    return (e.value.route is DialogRoute || e.value.route.runtimeType.toString().contains(_modalBottomSheetRoute));
  }

  /// Route generation method. This function can be used as a way to create routes on-the-fly
  /// if any defined handler is found. It can also be used with the [MaterialApp.onGenerateRoute]
  /// property as callback to create routes that can be used with the [Navigator] class.
  Route<dynamic>? generator(RouteSettings routeSettings) {
    RouteMatch match = matchRoute(null, routeSettings.name, routeSettings: routeSettings);
    return match.route;
  }

}

final AppRouter = _AppRouter();
