import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReglasScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Regla de cartas',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xffFF414D),
                      fontFamily: 'Lexend',
                    
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Acción para editar reglas
                        },
                        child: Text(
                          'Editar reglas',
                          style: TextStyle(
                            color: Color(0xFF002D40), // Color del texto
                            fontFamily: 'Lexend',
                            fontSize: 8,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // Color de fondo del botón
                          onPrimary: Color(0xFF002D40), // Color del texto/icono cuando está en reposo
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18), // Borde redondeado
                          ),
                          minimumSize: Size(5, 5), // Tamaño mínimo del botón
                        ),
                      ),
                      SizedBox(width: 0), // Espacio entre botones
                      IconButton(
                        icon: Icon(Icons.help, color: Color(0xFF002D40)), // Color del ícono
                        onPressed: () {
                          // Acción para mostrar ayuda
                        },
                        constraints: BoxConstraints(), // Restricciones para hacer el botón más pequeño
                        padding: EdgeInsets.all(2), // Padding interno del botón
                        iconSize: 10, // Tamaño del ícono
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: reglas.length,
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
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
        ],
      ),
    );
  }
}
