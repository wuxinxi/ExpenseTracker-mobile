part of 'simple_provider.dart';

///
/// @date: 2023/8/4 10:04
/// @author: Sensi
/// @remark:
///

class _SimpleInheritedWidget<T> extends InheritedWidget {
  final T value;

  const _SimpleInheritedWidget({super.key, required this.value, required super.child});

  static T of<T>(BuildContext context, {bool listable = true}) {
    final inheritedWidget = listable
        ? context.dependOnInheritedWidgetOfExactType<_SimpleInheritedWidget<T>>()
        : context.getInheritedWidgetOfExactType<_SimpleInheritedWidget<T>>();
    assert(inheritedWidget != null, "Not find SimpleInheritedWidget...");
    return inheritedWidget!.value;
  }

  @override
  bool updateShouldNotify(covariant _SimpleInheritedWidget oldWidget) {
    return this.value != oldWidget;
  }
}
