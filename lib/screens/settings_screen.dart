import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const ListTile(title: Text('Valuta'), subtitle: Text('EUR')),
        SwitchListTile(
          title: const Text('Dark mode (prototype)'),
          value: false,
          onChanged: (_) {},
        ),
        ListTile(
          title: const Text('Over Expensio'),
          subtitle: const Text('Versie 0.1.0'),
        ),
      ],
    );
  }
}
