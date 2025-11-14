import 'package:expensio/core/models/transaction_model.dart';

class TransactionRepository {
  // Tijdelijke dummy data
  final List<TransactionModel> _transactions = [
    TransactionModel(
      id: '1',
      title: 'Boodschappen',
      amount: 12.45,
      date: DateTime(2025, 1, 8),
      category: 'Boodschappen',
    ),
    TransactionModel(
      id: '2',
      title: 'Bus',
      amount: 2.90,
      date: DateTime(2025, 1, 7),
      category: 'Vervoer',
    ),
    TransactionModel(
      id: '3',
      title: 'Koffie',
      amount: 3.50,
      date: DateTime(2025, 1, 6),
      category: 'Vrije tijd',
    ),
  ];

  List<TransactionModel> getAll() {
    return List.unmodifiable(_transactions);
  }

  void add(TransactionModel model) {
    _transactions.add(model);
  }
}
