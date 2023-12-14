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
          
            
            
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,
                    size: 20,
                    
                    ),
                    onPressed: () {

                       GoRouter.of(context).go('/playerSelection');
                      // Aquí colocas tu acción para regresar
                    },
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
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Color de fondo del botón
                          foregroundColor: Color(0xFF002D40), // Color del texto/icono cuando está en reposo
                          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18), // Borde redondeado
                          ),
                          minimumSize: Size(5, 5), // Tamaño mínimo del botón
                        ),
                      ),
                      SizedBox(width: 5), // Espacio entre botones
                     ElevatedButton.icon(
                      onPressed: (
                        
                        
                      ) {
                        GoRouter.of(context).go('/');
                      },
                      icon: Icon(
                        Icons.hiking_rounded, // Ícono para el tutorial
                        size: 15, // Ajusta el tamaño del ícono para que coincida con el estilo general
                      ),
                      label: Text(
                        'Tutorial',
                        style: TextStyle(
                          color: Colors.black, // Color del texto
                          fontSize: 10, // Asegúrate de que el tamaño del texto coincida con el del botón "Editar reglas"
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Color de fondo del botón
                        foregroundColor: Colors.black, // Color del texto e ícono en estado de reposo
                        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 8), // Mismo relleno que el botón "Editar reglas"
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18), // Bordes redondeados del botón
                        ),
                        minimumSize: Size(5, 5), // Tamaño mínimo del botón, ajusta según sea necesario para que coincida con el otro botón
                      ),
                    )
                    ],
                  ),
                ],
              ),
            ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 29),
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
                      padding: EdgeInsets.fromLTRB(35, index == 0 ? 0 : 25, 35, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            descripcionRegla,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            carta,
                            style: TextStyle(
                              color: Color(0xffF56A79),
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w900,
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
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 35),
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
