// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
                arguments: product,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext ctx) => AlertDialog(
                title: const Text('Tem Certeza?'),
                content: Text('Deseja mesmo remover o item ${product.name}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      'Confirmar',
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                ],
              ),
            ).then((value) async {
              try {
                await Provider.of<ProductList>(
                  context,
                  listen: false,
                ).removeProduct(product);
              } catch (e) {
                msg.showSnackBar(
                  SnackBar(content: Text(e.toString()))
                );
              }
            }),
          ),
        ]),
      ),
    );
  }
}
