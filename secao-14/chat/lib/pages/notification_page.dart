import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Minhas notificações'),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
      ),
      body: const Center(child: Text('Notificações')),
    );
  }
}