// lib/presentation/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Aquí puedes leer los providers si es necesario

    return Scaffold(
      appBar: AppBar(
        title: Text('Cuarto Rey'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido al juego del Cuarto Rey',
              style: Theme.of(context).textTheme.headline4,
            ),
            // Agregar más widgets aquí como botones o imágenes
          ],
        ),
      ),
      // Puedes agregar un Drawer, FloatingActionButton, etc.
    );
  }
}
