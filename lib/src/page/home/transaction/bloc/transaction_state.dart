part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TransactionData {
  final int id;
  final double amount;

  TransactionData({required this.id, required this.amount});

  TransactionData copy({int? id, double? amount}) {
    return TransactionData(id: id ?? this.id, amount: amount ?? this.amount);
  }
}
