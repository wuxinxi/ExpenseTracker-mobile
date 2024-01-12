import 'package:app_common/app_common.dart';
import 'package:flutter/cupertino.dart';

///
/// @date: 2023/5/17 10:53
/// @author: Sensi
/// @remark:
///

enum StateLifecycle {
  /// The [State] object has been created. [State.initState] is called at this
  /// time.
  created,

  /// The [State] object is ready to build and [State.dispose] has not yet been
  /// called.
  ready,

  /// The [State.dispose] method has been called and the [State] object is
  /// no longer able to build.
  defunct,
}

abstract class LifecycleState<T extends StatefulWidget> extends State<T> {
  StateLifecycle _lifecycleState = StateLifecycle.created;

  StateLifecycle get lifecycleState => _lifecycleState;

  final List<VoidCallback> _listenableCallback = [];

  Listenable? get listenable => null;

  bool get notifyRebuild => true;

  @override
  void initState() {
    listenable?.let((_) => setListener(notifyDefaultListener));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lifecycleState = StateLifecycle.ready;
      readyListener();
    });
  }

  void setListener(VoidCallback listener) {
    _listenableCallback.add(listener);
    listenable?.addListener(listener);
  }

  void notifyDefaultListener() {
    if (notifyRebuild) {
      rebuild();
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (isReady && isActive) {
      super.setState(fn);
    }
  }

  void rebuild() {
    setState(() {});
  }

  bool get isActive => lifecycleState != StateLifecycle.defunct && mounted;

  bool get isReady => lifecycleState == StateLifecycle.ready;

  void readyListener() {}

  @override
  void dispose() {
    _lifecycleState = StateLifecycle.defunct;
    for (final listener in _listenableCallback) {
      listenable?.removeListener(listener);
    }
    super.dispose();
  }
}
