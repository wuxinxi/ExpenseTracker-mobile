import 'package:app_utils/src/hive/db/table/table.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

///
/// @date: 2023/8/6 9:05
/// @author: Sensi
/// @remark:
///

@HiveType(typeId: 1)
class Transaction extends Table {
  @override
  @HiveField(0)
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  double amount;
  @HiveField(3)
  int categoryId;
  @HiveField(4)
  String date;
  @HiveField(5)
  String createDate;
  @HiveField(6)
  String? updateDate;
  @HiveField(7)
  int memberId;
  @HiveField(8)
  int? transactionMethod = 0;
  @HiveField(9)
  int transactionType;

  Transaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.categoryId,
    required this.date,
    required this.createDate,
    this.updateDate,
    required this.memberId,
    this.transactionMethod,
    required this.transactionType,
  }) : super(id: id);
}
