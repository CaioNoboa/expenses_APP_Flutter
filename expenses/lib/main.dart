import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despersas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple.shade200,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${transaction.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(transaction.date),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
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
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
