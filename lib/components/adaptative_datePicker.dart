import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AdaptativeDatePicker extends StatelessWidget {
  late final DateTime selectedDate;
  late final Function(DateTime) onDateChange;

  AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChange,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      // função assíncrona
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // por ser assíncrona, passamos outra função dentro que será chamada ao selecionarmos a data
      if (pickedDate == null) {
        return;
      }
      onDateChange(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange,
            ),
        )
        : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
