part of 'simple_provider.dart';

///
/// @date: 2023/8/4 10:58
/// @author: Sensi
/// @remark:
///

extension Consumer on BuildContext {
  T watch<T>() => SimpleProvider.watch(this);

  T read<T>() => SimpleProvider.read(this);
}
