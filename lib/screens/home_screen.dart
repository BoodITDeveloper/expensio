import 'package:expensio/screens/settings_screen.dart';
import 'package:expensio/screens/transactions_list_screen.dart';
import 'package:flutter/material.dart';

import 'add_transaction_screen.dart';
import 'chart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Views die de BottomNavigationBar aanstuurt
  static const List<Widget> _views = <Widget>[
    Center(child: Text('Home overview (placeholder)', style: TextStyle(fontSize: 18))),
    TransactionsListPage(),
    ChartPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 4,
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Hier kun je naar het profiel scherm navigeren
              print('Profiel icoon aangeklikt');
            },
          ),
        ],
      ),
      body: _views.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // push naar add screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Transacties'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Grafiek'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Instellingen'),
        ],
      ),
    );
  }
}