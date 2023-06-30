import 'package:flutter/material.dart';
import 'package:my_locations/model/place.dart';
import 'package:my_locations/pages/map_page.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.file(
                place.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              place.location!.address!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapPage(
                    isReadonly: true,
                    initialLocation: place.location!,
                  ),
                ));
              },
              icon: const Icon(Icons.map),
              label: const Text('Ver no Mapa'),
            )
          ],
        ),
      ),
    );
  }
}
