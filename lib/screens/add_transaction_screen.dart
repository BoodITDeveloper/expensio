import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();
  DateTime _date = DateTime.now();
  String _category = 'Overig';

  @override
  void dispose() {
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final amt = double.tryParse(_amountCtrl.text.replaceAll(',', '.')) ?? 0.0;
      // Voor nu: printen naar console. Later: stuur naar Cubit/Repo.
      debugPrint('Toevoegen: €$amt, categorie=$_category, datum=$_date, note=${_noteCtrl.text}');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voeg transactie toe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _category,
                items: const [
                  DropdownMenuItem(value: 'Boodschappen', child: Text('Boodschappen')),
                  DropdownMenuItem(value: 'Vervoer', child: Text('Vervoer')),
                  DropdownMenuItem(value: 'Vrije tijd', child: Text('Vrije tijd')),
                  DropdownMenuItem(value: 'Overig', child: Text('Overig')),
                ],
                onChanged: (v) {
                  if (v != null) setState(() => _category = v);
                },
                decoration: const InputDecoration(labelText: 'Categorie'),
              ),
              TextFormField(
                controller: _amountCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Bedrag (EUR)'),
                validator: (v) {
                  final text = v?.trim() ?? '';
                  if (text.isEmpty) return 'Vul een bedrag in';
                  if (double.tryParse(text.replaceAll(',', '.')) == null) return 'Ongeldig bedrag';
                  return null;
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Datum: ${DateFormat.yMd().format(_date)}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              TextFormField(
                controller: _noteCtrl,
                decoration: const InputDecoration(labelText: 'Notitie (optioneel)'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Voeg toe'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}