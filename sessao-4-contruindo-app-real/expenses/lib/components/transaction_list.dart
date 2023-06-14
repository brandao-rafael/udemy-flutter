import 'package:expenses/components/list_item.dart';
import 'package:expenses/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return ListItem(
                key: GlobalObjectKey(tr), // bad performance
                tr: tr,
                onRemove: onRemove,
              );
            },
          );

        // ListView(
        //   children: transactions.map((tr) => {
        //     return ListItem(
        //       key: ValueKey(tr.id), // more performance
        //       tr: tr,
        //       onRemove: onRemove,
        //     )
        //   }),
        // )
  }
}

// color: Theme.of(context).primaryColor,
// Agora será assim:

// color: Theme.of(context).colorScheme.primary,
// Basicamente é isso galera. Bons estudos!

// Theme.of(context).textTheme.title
// Você vai deixar assim

// Theme.of(context).textTheme.headline6
// Bons estudos!
