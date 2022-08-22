
import 'package:flutter/material.dart';

import '../../Model/dbmodel/transactionmodel.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  final TransactionModel transactions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(transactions.type),
                Text(
                  '\$ ${double.parse(transactions.amount)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Text(
              transactions.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(transactions.date),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}