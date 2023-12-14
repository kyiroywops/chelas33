import 'package:cuartoreydif/infrastructure/models/cardrule_models.dart';
import 'package:cuartoreydif/infrastructure/repositories/cardrules_repository.dart';
import 'package:cuartoreydif/presentation/providers/cardrules_providers.dart';
import 'package:cuartoreydif/presentation/providers/deck_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playing_cards/playing_cards.dart';

class CardAssignmentScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa los cambios en el provider de la baraja
    List<PlayingCard> deck = ref.watch(deckProvider);

    // Observa el estado actual de las reglas de las cartas
    final cardRulesRepo = ref.watch(cardRulesProvider);

    // Método para manejar la acción de sacar una carta
    void handleDrawCard() {
      // Verifica que haya cartas en la baraja antes de intentar sacar una
      if (deck.isNotEmpty) {
        // Saca la carta superior de la baraja
        PlayingCard drawnCard = deck.first;
        // Encuentra la regla correspondiente a la carta sacada
        CardRule? rule = CardRulesRepository.getRuleForCard(drawnCard.value.toString());

        // Actualiza la UI aquí con la regla obtenida
        // ... (puede necesitar un StateProvider o algo similar para actualizar la UI)

        // Saca la carta del estado del deckProvider
        ref.read(deckProvider.notifier).drawCard();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Asignar Juegos a Cartas")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (deck.isNotEmpty)
              PlayingCardView(card: deck.first), // Muestra la carta actual
            if (deck.isNotEmpty)
              Text(CardRulesRepository.getRuleForCard(deck.first.value.toString())?.rule ?? "No hay regla para esta carta"),

            ElevatedButton(
              onPressed: handleDrawCard,
              child: Text("Sacar Carta"),
            ),
          ],
        ),
      ),
    );
  }
}
