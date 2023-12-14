class CardRule {
  final String
      card; 
  final String rule;
  final String difficulty;
  final String message;
  final String? gameState;
  final bool? isRoundActive;
  final String cardName;

  CardRule({
    required this.card, // Asegúrate de que 'card' use valores como 'As', 'K', 'Q', 'J', etc.
    required this.rule,
    this.difficulty = 'Easy',
    required this.message,
    this.gameState,
    this.isRoundActive,
    required this.cardName,
  });

  CardRule copyWith({
    String? card,
    String? rule,
    String? difficulty,
    String? message,
    String? gameState,
    bool? isRoundActive,
    String? cardName,
  }) {
    return CardRule(
      card: card ?? this.card,
      rule: rule ?? this.rule,
      difficulty: difficulty ?? this.difficulty,
      message: message ?? this.message,
      gameState: gameState ?? this.gameState,
      isRoundActive: isRoundActive ?? this.isRoundActive,
      cardName: cardName ?? this.cardName,
    );
  }
}
