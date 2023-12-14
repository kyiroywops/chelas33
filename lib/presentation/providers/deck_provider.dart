import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playing_cards/playing_cards.dart';
import 'dart:math';

// Notifier que manejará la lógica de la baraja de cartas
class DeckNotifier extends StateNotifier<List<PlayingCard>> {
  DeckNotifier() : super(DeckNotifier._initializeDeck());

  // Método privado para crear e inicializar la baraja de cartas y barajarlas
 static List<PlayingCard> _initializeDeck() {
  var deck = <PlayingCard>[];

  // Genera la baraja completa de cartas excluyendo los Jokers
  for (var suit in Suit.values) {
    // Excluye el palo de los Jokers
    if (suit != Suit.joker) {
      for (var cardValue in CardValue.values) {
        // Excluye los valores de los Jokers
        if (cardValue != CardValue.joker_1 && cardValue != CardValue.joker_2) {
          deck.add(PlayingCard(suit, cardValue));
        }
      }
    }
  }

  // Baraja las cartas
  var random = Random();
  deck.shuffle(random);

  return deck;
}

  // Método para sacar una carta aleatoria de la baraja
  void drawCard() {
    if (state.isNotEmpty) {
      state.removeAt(0);
      state = [...state]; // Notifica a los oyentes con una nueva instancia de la lista
    } else {
      throw Exception('No more cards in the deck');
    }
  }
}

// Provider que usa DeckNotifier para manejar el estado de la baraja de cartas
final deckProvider = StateNotifierProvider<DeckNotifier, List<PlayingCard>>((ref) {
  return DeckNotifier();
});
