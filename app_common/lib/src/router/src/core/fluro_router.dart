import 'dart:async';
import 'package:app_common/app_common.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template fluro_router}
/// Attach [FluroRouter] to [MaterialApp] by connnecting [FluroRouter.generator] to [MaterialApp.onGenerateRoute].
///
/// Define routes with [FluroRouter.define], optionally specifying transition types and connecting string path params to
/// your screen widget's constructor.
///
/// Push new route paths with [FluroRouter.appRouter.navigateTo] or continue to use [Navigator.of(context).push] if you prefer.
/// {@endtemplate}
class FluroRouter {
  /// The static / singleton instance of [FluroRouter]
  ///
  /// {@macro fluro_router}
  static final appRouter = FluroRouter();

  /// The tree structure that stores the defined routes
  final RouteTree _routeTree = RouteTree();

  /// Generic handler for when a route has not been defined
  Handler? notFoundHandler = Handler(handlerFunc: (context, parameters) => const NotFoundPage());

  /// The default transition duration to use throughout Fluro
  static const defaultTransitionDuration = Duration(milliseconds: 250);

  /// Creates a [PageRoute] definition for the passed [RouteHandler]. You can optionally provide a default transition type.
  void define(String routePath,
      {required Handler? handler,
      TransitionType? transitionType,
      Duration transitionDuration = defaultTransitionDuration,
      RouteTransitionsBuilder? transitionBuilder}) {
    _routeTree.addRoute(
      AppRoute(routePath, handler,
          transitionType: transitionType, transitionDuration: transitionDuration, transitionBuilder: transitionBuilder),
    );
  }

  /// Finds a defined [AppRoute] for the path value. If no [AppRoute] definition was found
  /// then function will return null.
  AppRouteMatch? match(String path) {
    return _routeTree.matchRoute(path);
  }

  /// Similar to [Navigator.pop]
  void pop<T>({BuildContext? context, T? result}) => Navigator.of(context ?? Application.context).pop(result);

  /// Similar to [Navigator.push] but with a few extra features.
  Future navigateTo<T extends StateStreamableSource<Object?>>(String path,
      {BuildContext? context,
      bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      Widget? targetPage,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      T? bloc,
      RouteSettings? routeSettings}) async {
    RouteMatch routeMatch = matchRoute(
      context,
      path,
      transitionType: transition,
      transitionsBuilder: transitionBuilder,
      transitionDuration: transitionDuration,
      maintainState: maintainState,
      routeSettings: routeSettings,
      targetPage: targetPage,
      value: bloc,
    );
    Route<dynamic>? route = routeMatch.route;
    Completer completer = Completer();
    Future future = completer.future;
    if (routeMatch.matchType == RouteMatchType.nonVisual) {
      completer.complete("Non visual route type.");
    } else {
      if (route == null && notFoundHandler != null) {
        route = _notFoundRoute(context ?? Application.context, path, maintainState: maintainState);
      }
      if (route != null) {
        final navigator = Navigator.of(context ?? Application.context, rootNavigator: rootNavigator);
        if (clearStack) {
          future = navigator.pushAndRemoveUntil(route, (check) => false);
        } else {
          future = replace ? navigator.pushReplacement(route) : navigator.push(route);
        }
        completer.complete();
      } else {
        final error = "No registered route was found to handle '$path'.";
        completer.completeError(RouteNotFoundException(error, path));
      }
    }

    return future;
  }

  Route<void> _notFoundRoute(BuildContext context, String path, {bool? maintainState}) {
    creator(RouteSettings? routeSettings, Map<String, List<String>> parameters) {
      return MaterialPageRoute<void>(
          settings: routeSettings,
          maintainState: maintainState ?? true,
          builder: (BuildContext context) {
            return notFoundHandler?.handlerFunc(context, parameters) ?? const SizedBox.shrink();
          });
    }

    return creator(RouteSettings(name: path), {});
  }

  /// Attempt to match a route to the provided [path].
  RouteMatch matchRoute<T extends StateStreamableSource<Object?>>(
    BuildContext? buildContext,
    String? path, {
    RouteSettings? routeSettings,
    TransitionType? transitionType,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionsBuilder,
    bool maintainState = true,
    Widget? targetPage,
    T? value,
  }) {
    RouteSettings settingsToUse = routeSettings ?? RouteSettings(name: path);

    if (settingsToUse.name == null) {
      settingsToUse = RouteSettings(name: path);
    }
    AppRouteMatch? match = _routeTree.matchRoute(path!);
    AppRoute? route = match?.route;

    if (transitionDuration == null && route?.transitionDuration != null) {
      transitionDuration = route?.transitionDuration;
    }

    Handler handler = (route != null ? route.handler : notFoundHandler);
    TransitionType? transition = transitionType;
    if (transitionType == null) {
      transition = route != null ? route.transitionType : TransitionType.native;
    }
    if (route == null && notFoundHandler == null) {
      return RouteMatch(matchType: RouteMatchType.noMatch, errorMessage: "No matching route was found");
    }
    Map<String, List<String>> parameters = match?.parameters ?? <String, List<String>>{};
    if (handler.type == HandlerType.function) {
      handler.handlerFunc(buildContext, parameters);
      return RouteMatch(matchType: RouteMatchType.nonVisual);
    }

    creator(RouteSettings? routeSettings, Map<String, List<String>> parameters) {
      bool isNativeTransition = (transition == TransitionType.native || transition == TransitionType.nativeModal);
      if (isNativeTransition) {
        return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == TransitionType.nativeModal,
            maintainState: maintainState,
            builder: (BuildContext context) {
              if (value != null) {
                return BlocProvider.value(
                    value: value,
                    child: targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink());
              }
              return targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink();
            });
      } else if (transition == TransitionType.material || transition == TransitionType.materialFullScreenDialog) {
        return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == TransitionType.materialFullScreenDialog,
            maintainState: maintainState,
            builder: (BuildContext context) {
              if (value != null) {
                return BlocProvider.value(
                    value: value,
                    child: targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink());
              }
              return targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink();
            });
      } else if (transition == TransitionType.cupertino || transition == TransitionType.cupertinoFullScreenDialog) {
        return CupertinoPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == TransitionType.cupertinoFullScreenDialog,
            maintainState: maintainState,
            builder: (BuildContext context) {
              if (value != null) {
                return BlocProvider.value(
                    value: value,
                    child: targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink());
              }
              return targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink();
            });
      } else {
        RouteTransitionsBuilder? routeTransitionsBuilder;
        if (transition == TransitionType.custom) {
          routeTransitionsBuilder = transitionsBuilder ?? route?.transitionBuilder;
        } else {
          routeTransitionsBuilder = _standardTransitionsBuilder(transition);
        }
        return PageRouteBuilder<dynamic>(
          settings: routeSettings,
          maintainState: maintainState,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            if (value != null) {
              return BlocProvider.value(
                  value: value,
                  child: targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink());
            }
            return targetPage ?? handler.handlerFunc(context, parameters) ?? const SizedBox.shrink();
          },
          transitionDuration: transition == TransitionType.none
              ? Duration.zero
              : (transitionDuration ?? route?.transitionDuration ?? defaultTransitionDuration),
          reverseTransitionDuration: transition == TransitionType.none
              ? Duration.zero
              : (transitionDuration ?? route?.transitionDuration ?? defaultTransitionDuration),
          transitionsBuilder:
              transition == TransitionType.none ? (_, __, ___, child) => child : routeTransitionsBuilder!,
        );
      }
    }

    return RouteMatch(
      matchType: RouteMatchType.visual,
      route: creator(settingsToUse, parameters),
    );
  }

  RouteTransitionsBuilder _standardTransitionsBuilder(TransitionType? transitionType) {
    return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      if (transitionType == TransitionType.fadeIn) {
        return FadeTransition(opacity: animation, child: child);
      } else {
        const Offset topLeft = Offset(0.0, 0.0);
        const Offset topRight = Offset(1.0, 0.0);
        const Offset bottomLeft = Offset(0.0, 1.0);

        Offset startOffset = bottomLeft;
        Offset endOffset = topLeft;
        if (transitionType == TransitionType.inFromLeft) {
          startOffset = const Offset(-1.0, 0.0);
          endOffset = topLeft;
        } else if (transitionType == TransitionType.inFromRight) {
          startOffset = topRight;
          endOffset = topLeft;
        } else if (transitionType == TransitionType.inFromBottom) {
          startOffset = bottomLeft;
          endOffset = topLeft;
        } else if (transitionType == TransitionType.inFromTop) {
          startOffset = const Offset(0.0, -1.0);
          endOffset = topLeft;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: startOffset,
            end: endOffset,
          ).animate(animation),
          child: child,
        );
      }
    };
  }

  /// Prints the route tree so you can analyze it.
  void printTree() {
    _routeTree.printTree();
  }
}
