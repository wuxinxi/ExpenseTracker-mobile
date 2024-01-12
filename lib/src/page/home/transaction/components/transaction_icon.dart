import 'package:app_common/app_common.dart';
import 'package:expense_tracker/src/data/transaction_icon_data.dart';

///
/// @date: 2023/7/16 11:43
/// @author: Sensi
/// @remark:
///

const defaultExpenseTransactionIcon = [
  //餐饮
  TransactionIconData(iconData: Symbols.restaurant, name: '餐饮', id: 0),
  //购物
  TransactionIconData(iconData: Symbols.shopping_bag, name: '购物', id: 1),
  //日用
  TransactionIconData(iconData: Symbols.scene, name: '日用', id: 2),
  //交通
  TransactionIconData(iconData: Symbols.airport_shuttle, name: '交通', id: 3),
  //运动
  TransactionIconData(iconData: Symbols.pool, name: '运动', id: 4),
  //娱乐
  TransactionIconData(iconData: Symbols.nightlife, name: '娱乐', id: 5),
  //通讯
  TransactionIconData(iconData: Symbols.phone_in_talk, name: '通讯', id: 6),
  //服饰
  TransactionIconData(iconData: Symbols.phone_in_talk, name: '服饰', id: 7),
  //美容
  TransactionIconData(iconData: Symbols.face, name: '美容', id: 8),
  //住房
  TransactionIconData(iconData: Symbols.cottage, name: '住房', id: 9),
  //居家
  TransactionIconData(iconData: Symbols.chair, name: '居家', id: 10),
  //旅行
  TransactionIconData(iconData: Symbols.flight, name: '旅行', id: 11),
  //数码
  TransactionIconData(iconData: Symbols.thirty_fps_sharp, name: '数码', id: 12),
  //汽车
  TransactionIconData(iconData: Symbols.directions_car, name: '汽车', id: 13),
  //医疗
  TransactionIconData(iconData: Symbols.medical_services, name: '医疗', id: 14),
  //书籍
  TransactionIconData(iconData: Symbols.book, name: '书籍', id: 15),
  //学习 教育
  TransactionIconData(iconData: Symbols.school, name: '学习', id: 16),
  //宠物
  TransactionIconData(iconData: Symbols.pets, name: '宠物', id: 17),
  //礼金
  TransactionIconData(iconData: Symbols.monetization_on, name: '礼金', id: 18),
  //礼物
  TransactionIconData(iconData: Symbols.redeem, name: '礼物', id: 19),
  //办公
  TransactionIconData(iconData: Symbols.print, name: '办公', id: 20),
  //维修
  TransactionIconData(iconData: Symbols.healing, name: '维修', id: 21),
  //捐赠
  TransactionIconData(iconData: Symbols.heart_plus, name: '捐赠', id: 22),
  //捐赠
  TransactionIconData(iconData: Symbols.voting_chip, name: '新增', id: 23),
];

const defaultIncomeTransactionIcon = [
  //工资
  TransactionIconData(iconData: Symbols.credit_card, name: '工资', id: 0),
  //理财
  TransactionIconData(iconData: Symbols.currency_exchange, name: '理财', id: 1),
  //礼金
  TransactionIconData(iconData: Symbols.monetization_on, name: '礼金', id: 2),
  //其他
  TransactionIconData(iconData: Symbols.local_atm, name: '其他', id: 3),
  //新增
  TransactionIconData(iconData: Symbols.voting_chip, name: '新增', id: 4),
];
