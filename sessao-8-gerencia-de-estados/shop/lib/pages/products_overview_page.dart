// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Minha Loja')),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Todos'),
              ),
            ],
          )
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
