import 'dart:math';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
    final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta #3',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta #4',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta #5',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta #6',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Conta #7',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'Conta #8',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't9',
      title: 'Conta #9',
      value: 125.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't10',
      title: 'Conta #10',
      value: 125.00,
      date: DateTime.now(),
    ),
  ];
  
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}