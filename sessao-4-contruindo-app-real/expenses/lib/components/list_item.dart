import 'dart:math';

import 'package:expenses/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String) onRemove;
  
  const ListItem({super.key, required this.tr, required this.onRemove});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  static const colors = [
    Colors.amber,
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.red
  ];

  late Color _backgroundColor = Colors.black;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _backgroundColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                  child: Text(
                'R\$${widget.tr.value.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              )),
            ),
          ),
          title: Text(
            widget.tr.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            DateFormat('d MMM y').format(widget.tr.date),
          ),
          trailing: MediaQuery.of(context).size.width > 480
              ? TextButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () => widget.onRemove(widget.tr.id),
                )),
    );
  }
}
