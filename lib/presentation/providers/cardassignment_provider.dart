import 'package:cuartoreydif/infrastructure/models/cardrule_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

// Asumiendo que tienes un modelo de carta que incluye las reglas y otras propiedades

class CardAssignmentNotifier extends StateNotifier<List<CardRule>> {
  CardAssignmentNotifier() : super([]);

  // Lógica para inicializar y barajar las cartas
  void initializeDeck(List<CardRule> cards) {
    var random = Random();
    // Baraja las cartas de manera aleatoria
    state = cards..shuffle(random);
  }

  // Sacar una carta de manera aleatoria
  CardRule drawCard() {
    if (state.isEmpty) {
      // Manejar el caso cuando no hay más cartas
      throw Exception('No more cards to draw');
    }
    return state.removeAt(0); // Remueve la carta de la parte superior del mazo
  }
}

// Declara el provider usando StateNotifierProvider
final cardAssignmentProvider = StateNotifierProvider<CardAssignmentNotifier, List<CardRule>>((ref) {
  return CardAssignmentNotifier();
});
