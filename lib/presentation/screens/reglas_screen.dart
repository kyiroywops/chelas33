import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReglasScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Definir las reglas aquí o podrían venir de un modelo/estado si varían.
    final reglas = {
      'As': 'Todos toman',
      '2': 'Juego de los patos',
      '3': 'Limones',
      '4': 'Nunca nunca',
      '5': 'Todos toman',
      '6': 'Juego de los patos',
      '7': 'Limones',
      '8': 'Nunca nunca',
      '9': 'Todos toman',
      '10': 'Juego de los patos',
      'J': 'Limones',
      'Q': 'Nunca nunca',
      'K': 'Todos toman',
      // ... Añade el resto de las cartas y sus reglas
    };

     return Scaffold(
      appBar: AppBar(
        title: Text('Reglas del Juego', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: reglas.length + 1, // Se suma 1 para el botón al final
              itemBuilder: (BuildContext context, int index) {
                if (index < reglas.length) { // Si no es el último ítem, muestra la regla
                  String carta = reglas.keys.elementAt(index);
                  String descripcionRegla = reglas.values.elementAt(index);
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          descripcionRegla,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ReadexPro',
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          carta,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                } else { // Si es el último ítem, muestra el botón para iniciar la partida
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/cardAssignment');
                      },
                      child: Text('Iniciar Partida', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
