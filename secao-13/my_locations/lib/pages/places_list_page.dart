import 'package:flutter/material.dart';
import 'package:my_locations/providers/great_places.dart';
import 'package:my_locations/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Lugares'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  child: const Center(
                    child: Text('Nenhum local cadastrado'),
                  ),
                  builder: (ctx, greatPlaces, child) => greatPlaces
                              .itemsCount == 0
                      ? child!
                      : ListView.builder(
                          itemCount: greatPlaces.itemsCount,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  FileImage(greatPlaces.itemByIndex(i).image),
                            ),
                            title: Text(greatPlaces.itemByIndex(i).title),
                            subtitle: Text(
                                greatPlaces.itemByIndex(i).location!.address!),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.PLACE_DETAIL,
                                arguments: greatPlaces.itemByIndex(i),
                              );
                            },
                          ),
                        ),
                ),
        ));
  }
}
