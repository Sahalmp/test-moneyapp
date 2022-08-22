import 'package:hive_flutter/hive_flutter.dart';
  part 'transactionmodel.g.dart';

@HiveType(typeId: 1)
class TransactionModel {
  @HiveField(0)
  int key;

  @HiveField(1)
  String name;

  @HiveField(2)
  String type;

  @HiveField(3)
  String date;

  @HiveField(4)
  String amount;

  TransactionModel({
    required this.key,
    required this.name,
    required this.type,
    required this.date,
    required this.amount,
  });
}
