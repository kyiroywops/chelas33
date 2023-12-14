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
      backgroundColor: Color(0xFF002D40),
      appBar: AppBar(
        backgroundColor: Color(0xFF002D40),
        title: Text(
          'Cartas del Juego',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1AA6B7),
            fontFamily: 'Lexend',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.50),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            itemCount: reglas.length, // No necesitas agregar 1 aquí ya que no estás agregando el botón al final de la lista de reglas.
            itemBuilder: (BuildContext context, int index) {
              String carta = reglas.keys.elementAt(index);
              String descripcionRegla = reglas.values.elementAt(index);
              return Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      descripcionRegla,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      carta,
                      style: TextStyle(
                        color: Color(0xffF56A79),
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 60),
        child: ElevatedButton(
          onPressed: () {
            context.go('/cardAssignment');
          },
          child: Text('Iniciar Partida', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffFF414D).withOpacity(0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      ),
    ); 
  }
}
