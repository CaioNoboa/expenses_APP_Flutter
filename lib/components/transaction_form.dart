import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  late final Function(String title, double value) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0; // tentando converter para double e se não for possível, o valor padrão é 0
    if (title.isEmpty || value <= 0) {
      return; // sairá da função, ou seja, não será submetido
    }
    widget.onSubmit(title, value); // Em componentes statefull acessaremos os atributos da classe pai (TransactionForm) através do widget.
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Theme.of(context).colorScheme.primary,
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}