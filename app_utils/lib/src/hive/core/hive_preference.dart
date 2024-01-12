import 'package:hive/hive.dart';

///
/// @date: 2023/7/11 21:31
/// @author: Sensi
/// @remark:
///

const _hivePreferenceName = '_expense_tracker_preference';

class HivePreference {
  late final _preference = Hive.box(_hivePreferenceName);

  HivePreference._();

  static final HivePreference _instance = HivePreference._();

  factory HivePreference() {
    return _instance;
  }

  /// Checks whether the box contains the [key].
  bool containsKey(dynamic key) => _preference.containsKey(key);

  dynamic getString(dynamic key, {String? defaultValue = ''}) {
    return _preference.get(key, defaultValue: defaultValue);
  }

  /// Saves the [key] - [value] pair.
  Future<void> put(dynamic key, dynamic value) => _preference.put(key, value);

  /// Saves all the key - value pairs in the [entries] map.
  Future<void> putAll(Map<dynamic, dynamic> entries) => _preference.putAll(entries);

  /// Deletes the given [key] from the box.
  ///
  /// If it does not exist, nothing happens.
  Future<void> delete(dynamic key) => _preference.delete(key);

  /// Removes all entries from the box.
  Future<int> clear() => _preference.clear();
}
