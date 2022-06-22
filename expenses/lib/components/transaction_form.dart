import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  late final Function(String title, double value) onSubmit;
  TransactionForm(this.onSubmit);

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
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: () {
                    onSubmit(
                      titleController.text,
                      double.tryParse(valueController.text) ?? 0.0, // tentando converter para double e se não for possível, o valor padrão é 0
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
