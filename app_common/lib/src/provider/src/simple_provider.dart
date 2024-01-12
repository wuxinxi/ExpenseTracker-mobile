import 'package:flutter/material.dart';

part 'simple_inherited_widget.dart';

part 'consumer.dart';

///
/// @date: 2023/8/4 10:02
/// @author: Sensi
/// @remark:
///

class SimpleProvider<T extends Listenable> extends StatefulWidget {
  final T Function() create;
  final Widget child;

  const SimpleProvider({Key? key, required this.create, required this.child}) : super(key: key);

  @override
  State<SimpleProvider> createState() => _SimpleProviderState<T>();

  static T watch<T>(BuildContext context) => _SimpleInheritedWidget.of<T>(context, listable: true);

  static T read<T>(BuildContext context) => _SimpleInheritedWidget.of<T>(context, listable: false);
}

class _SimpleProviderState<T extends Listenable> extends State<SimpleProvider<T>> {
  late T _value;

  @override
  void initState() {
    _value = widget.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _value,
      builder: (BuildContext context, Widget? child) => _SimpleInheritedWidget(value: _value, child: widget.child),
    );
  }
}
