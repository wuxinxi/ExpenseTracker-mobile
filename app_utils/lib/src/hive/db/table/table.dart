import 'package:hive/hive.dart';

///
/// @date: 2023/8/6 10:28
/// @author: Sensi
/// @remark:
///

class Table extends HiveObject {
  @HiveField(0)
  int id;

  Table({required this.id});
}
