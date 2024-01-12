import 'package:app_utils/src/hive/db/table/table.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

///
/// @date: 2023/8/6 9:28
/// @author: Sensi
/// @remark:
///
@HiveType(typeId: 3)
class Category extends Table {
  @HiveField(0)
  @override
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String categoryName;
  @HiveField(3)
  String? categoryIconUrl;

  Category({
    required this.id,
    required this.userId,
    required this.categoryName,
    this.categoryIconUrl,
  }) : super(id: id);
}
