import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  late final List<Transaction> transactions;
  late final Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320, // precisa de uma altura pré-definida para o scroll funcionar
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemExtent: 90.0,
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                // com isso, mesmo que tenha 10.000 transações, não as mostrará e as carregará tudo de uma vez, melhorando performance
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headline5,
                          ),                          
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      color: Theme.of(context).errorColor,
                      onPressed: () => onRemove(tr.id),
                      ),
                  ),
                );
              },
            ),
    );
  }
}