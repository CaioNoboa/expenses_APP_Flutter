import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_datePicker.dart';
import 'package:flutter/material.dart';
import 'adaptative_textField.dart';

class TransactionForm extends StatefulWidget {
  late final Function(String title, double value, DateTime) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ??
        0.0; // tentando converter para double e se não for possível, o valor padrão é 0
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return; // sairá da função, ou seja, não será submetido
    }
    widget.onSubmit(
      // Em componentes statefull acessaremos os atributos da classe pai (TransactionForm) através do widget.
      title,
      value,
      _selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8,
            right: 8,
            left: 8,
            bottom: 20 +
                MediaQuery.of(context)
                    .viewInsets
                    .bottom, // 10 + o tamanho do teclado
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                labelText: 'Título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                labelText: 'Valor (R\$)',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              //
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
