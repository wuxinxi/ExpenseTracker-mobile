part of approuter;

typedef WidgetBuilderCompat = Widget Function(BuildContext context, String path);

///
/// @date: 2022/4/19 08:54
/// @author: Sensi
/// @remark:
///
extension AppRouterExtension on _AppRouter {
  Future<T?> showDialog<T>({
    required WidgetBuilderCompat builder,
    String? path,
    BuildContext? context,
    Bundle? bundle,
    bool barrierDismissible = false,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
  }) async {
    path = path ?? _generatePath;
    final dialog = SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding: EdgeInsets.zero,
        children: [builder(context ?? Application.context, path)]);
    return await navigateToDialog(
      path: path,
      context: context ?? Application.context,
      builder: (context) => dialog,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useSafeArea,
    );
  }

  String get _generatePath => UniqueKey().toString();
}
