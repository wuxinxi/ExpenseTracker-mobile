import 'package:hive/hive.dart';

import '../../table/table.dart';

///
/// @date: 2023/8/6 9:54
/// @author: Sensi
/// @remark:
///

abstract class Mapper<T extends Table> {
  Future<Box<T>> openBox() async => await Hive.openBox<T>(tableName());

  String tableName();

  Future<List<T>> select() async {
    final box = await openBox();
    return box.values.toList();
  }

  Future<int> saveOrUpdate(T value) async {
    final box = await openBox();
    return await box.add(value);
  }

  Future<T?> selectById(int id) async {
    final box = await openBox();
    return box.get(id);
  }
}
