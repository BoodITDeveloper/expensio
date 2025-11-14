import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expensio/core/models/transaction_model.dart';
import 'package:expensio/core/repositories/transaction_repository.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = TransactionRepository();
    final List<TransactionModel> items = repo.getAll();

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final t = items[i];
        return ListTile(
          leading: CircleAvatar(child: Text(t.title[0])),
          title: Text(t.title),
          subtitle: Text(DateFormat.yMd().format(t.date)),
          trailing: Text('€${t.amount.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
