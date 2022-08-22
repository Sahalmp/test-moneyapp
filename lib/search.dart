import 'package:flutter/material.dart';
import 'package:moneyapp/view/screens/dashboard.dart';
import 'package:moneyapp/main.dart';
import 'package:moneyapp/view/widgets/transactiontile.dart';

class Mysearch extends SearchDelegate {
  final transactions = transactionBox.values.toList();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(""""$query" not found in list"""),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    transactions.sort((b, a) => a.key.compareTo(b.key));

    final listItems = query.isEmpty
        ? transactions
        : transactions
            .where((element) =>
                element.name
                    .toLowerCase()
                    .contains(query.toLowerCase().toString()) ||
                element.type
                    .toLowerCase()
                    .contains(query.toLowerCase().toString()) ||
                element.date
                    .toLowerCase()
                    .contains(query.toLowerCase().toString()) ||
                element.amount
                    .toLowerCase()
                    .contains(query.toLowerCase().toString()))
            .toList();
    return listItems.isEmpty
        ? const Center(child: Text("No Data Found!"))
        : ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return TransactionsSection(transactions: listItems[index]);
            });
  }
}
