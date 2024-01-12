/// transactions : [{"id":1680395525621149698,"userId":1,"amount":500,"categoryId":0,"date":"2023-07-03","createDate":"2023-07-16 09:54:48","updateDate":null,"memberId":0,"transactionMethod":0,"transactionType":0}]
/// incomeTotal : 500
/// expenseTotal : 0
/// count : 1

class TransactionModel {
  TransactionModel({
    List<Transactions>? transactions,
    num? incomeTotal,
    num? expenseTotal,
    num? count,
  }) {
    _transactions = transactions;
    _incomeTotal = incomeTotal;
    _expenseTotal = expenseTotal;
    _count = count;
  }

  TransactionModel.fromJson(dynamic json) {
    if (json['transactions'] != null) {
      _transactions = [];
      json['transactions'].forEach((v) {
        _transactions?.add(Transactions.fromJson(v));
      });
    }
    _incomeTotal = json['incomeTotal'];
    _expenseTotal = json['expenseTotal'];
    _count = json['count'];
  }

  List<Transactions>? _transactions;
  num? _incomeTotal;
  num? _expenseTotal;
  num? _count;

  TransactionModel copyWith({
    List<Transactions>? transactions,
    num? incomeTotal,
    num? expenseTotal,
    num? count,
  }) =>
      TransactionModel(
        transactions: transactions ?? _transactions,
        incomeTotal: incomeTotal ?? _incomeTotal,
        expenseTotal: expenseTotal ?? _expenseTotal,
        count: count ?? _count,
      );

  List<Transactions>? get transactions => _transactions;

  num? get incomeTotal => _incomeTotal;

  num? get expenseTotal => _expenseTotal;

  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_transactions != null) {
      map['transactions'] = _transactions?.map((v) => v.toJson()).toList();
    }
    map['incomeTotal'] = _incomeTotal;
    map['expenseTotal'] = _expenseTotal;
    map['count'] = _count;
    return map;
  }
}

/// id : 1680395525621149698
/// userId : 1
/// amount : 500
/// categoryId : 0
/// date : "2023-07-03"
/// createDate : "2023-07-16 09:54:48"
/// updateDate : null
/// memberId : 0
/// transactionMethod : 0
/// transactionType : 0

class Transactions {
  Transactions({
    num? id,
    num? userId,
    num? amount,
    num? categoryId,
    String? date,
    String? createDate,
    String? updateDate,
    num? memberId,
    num? transactionMethod,
    num? transactionType,
  }) {
    _id = id;
    _userId = userId;
    _amount = amount;
    _categoryId = categoryId;
    _date = date;
    _createDate = createDate;
    _updateDate = updateDate;
    _memberId = memberId;
    _transactionMethod = transactionMethod;
    _transactionType = transactionType;
  }

  Transactions.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _amount = json['amount'];
    _categoryId = json['categoryId'];
    _date = json['date'];
    _createDate = json['createDate'];
    _updateDate = json['updateDate'];
    _memberId = json['memberId'];
    _transactionMethod = json['transactionMethod'];
    _transactionType = json['transactionType'];
  }

  num? _id;
  num? _userId;
  num? _amount;
  num? _categoryId;
  String? _date;
  String? _createDate;
  dynamic _updateDate;
  num? _memberId;
  num? _transactionMethod;
  num? _transactionType;

  Transactions copyWith({
    num? id,
    num? userId,
    num? amount,
    num? categoryId,
    String? date,
    String? createDate,
    dynamic updateDate,
    num? memberId,
    num? transactionMethod,
    num? transactionType,
  }) =>
      Transactions(
        id: id ?? _id,
        userId: userId ?? _userId,
        amount: amount ?? _amount,
        categoryId: categoryId ?? _categoryId,
        date: date ?? _date,
        createDate: createDate ?? _createDate,
        updateDate: updateDate ?? _updateDate,
        memberId: memberId ?? _memberId,
        transactionMethod: transactionMethod ?? _transactionMethod,
        transactionType: transactionType ?? _transactionType,
      );

  num? get id => _id;

  num? get userId => _userId;

  num? get amount => _amount;

  num? get categoryId => _categoryId;

  String? get date => _date;

  String? get createDate => _createDate;

  String get updateDate => _updateDate;

  num? get memberId => _memberId;

  num? get transactionMethod => _transactionMethod;

  num? get transactionType => _transactionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['amount'] = _amount;
    map['categoryId'] = _categoryId;
    map['date'] = _date;
    map['createDate'] = _createDate;
    map['updateDate'] = _updateDate;
    map['memberId'] = _memberId;
    map['transactionMethod'] = _transactionMethod;
    map['transactionType'] = _transactionType;
    return map;
  }
}
