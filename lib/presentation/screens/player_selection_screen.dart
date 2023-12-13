// lib/presentation/screens/player_selection_screen.dart

import 'package:cuartoreydif/infrastructure/models/player_models.dart';
import 'package:cuartoreydif/presentation/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlayerSelectionScreen extends ConsumerStatefulWidget {
  @override
  _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends ConsumerState<PlayerSelectionScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedAvatar =
      'assets/images/avatars/avatar1.png'; // Ruta al avatar por defecto

  void _addPlayer() {
    final String name = _nameController.text;
    if (name.isNotEmpty && _selectedAvatar.isNotEmpty) {
      // Utiliza ref.read para obtener el notifier y luego asigna el nuevo estado
      ref.read(playerProvider.notifier).update((state) => [
            ...state,
            Player(name: name, avatar: _selectedAvatar),
          ]);
      _nameController
          .clear(); // Limpiar el campo de texto después de agregar un jugador
      _selectedAvatar =
          'assets/images/avatars/avatar1.png'; // Restablecer el avatar seleccionado
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Player> players = ref.watch(playerProvider);

    void _removePlayer(int index) {
      ref.read(playerProvider.notifier).update((state) {
        // Crea una nueva lista sin el jugador que quieres eliminar
        return List<Player>.from(state)..removeAt(index);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selecciona tus jugadores',
          style: TextStyle(fontWeight: FontWeight.w800, fontFamily: 'ReadexPro'

              // Aplica negrita al texto
              // Puedes añadir más estilos si lo deseas, como el tamaño de la fuente o el color
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 8.0), // Agrega márgenes verticales si es necesario
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical:
                      15.0), // Aumenta el padding para un container más grande
              decoration: BoxDecoration(
                color: Colors.black, // Fondo negro para el container
                borderRadius: BorderRadius.circular(
                    30), // Bordes redondeados para el container
              ),
              child: TextField(
                controller: _nameController,
                style: TextStyle(
                    color: Colors.white), // Texto blanco para el input
                cursorColor: Colors.white, // Color del cursor a blanco
                decoration: InputDecoration(
                  hintText: 'Nombre del jugador',
                  hintStyle: TextStyle(
                      color: Colors.white
                          .withOpacity(0.5)), // Hint en blanco con opacidad
                  border: InputBorder.none, // Sin borde
                  focusedBorder: UnderlineInputBorder(
                      // Borde cuando el TextField está enfocado
                      ),
                  enabledBorder: UnderlineInputBorder(
                    // Borde cuando el TextField está habilitado, pero no enfocado
                  
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical:
                          10), // Padding vertical para el texto dentro del input
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8, // Ajusta según el diseño de tu UI
                  crossAxisSpacing: 10, // Espaciado horizontal
                  mainAxisSpacing: 10, // Espaciado vertical
                ),
                itemCount: 16, // Asume que tienes 20 avatares
                itemBuilder: (context, index) {
                  String avatarAsset =
                      'assets/images/avatars/avatar${index + 1}.png';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAvatar =
                            avatarAsset; // Actualiza el avatar seleccionado
                      });
                    },
                    child: ClipOval(
                      child: Image.asset(
                        avatarAsset,
                        width: 10, // Ajusta el tamaño del avatar
                        height: 10, // Ajusta el tamaño del avatar
                        fit: BoxFit
                            .cover, // Esto asegura que la imagen llene el ClipOval
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addPlayer,
              child: Text(
                'Agregar jugador',
                style: TextStyle(color: Colors.white), // Letra blanca
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Fondo negro
                foregroundColor: Colors.white, // Color del texto y del ícono
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10), // Padding interior del botón
              ),
            ),
            SizedBox(height: 16),
            const Center(
              child: Text(
                'Listado de Jugadores',
                style: TextStyle(
                  fontFamily: 'ReadexPro',
                  fontWeight:
                      FontWeight.bold, // Si deseas que el texto esté en negrita
                  fontSize:
                      24, // Puedes ajustar el tamaño según tus necesidades
                  // Otros estilos si son necesarios
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: players
                    .length, // Usar la longitud de la lista obtenida del provider
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(players[index].avatar),
                    ),
                    title: Text(players[index].name),
                    // Icono para eliminar jugadores
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        // Llama a la función para eliminar este jugador específico
                        _removePlayer(index);
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de reglas
                GoRouter.of(context).go('/reglas');
              },
              child: Text(
                'Ir a las Reglas',
                style: TextStyle(color: Colors.white), // Letra blanca
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Fondo negro
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10), // Padding interior del botón
              ),
            )
          ],
        ),
      ),
    );
  }
}
