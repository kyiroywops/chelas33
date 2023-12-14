class CardRule {
  final String card;
  final String rule;
  final String difficulty; // Añadir más propiedades según sea necesario

  CardRule({required this.card, required this.rule, this.difficulty = 'Easy'});

  // Método para actualizar la dificultad o cualquier otra propiedad
  CardRule copyWith({String? difficulty}) {
    return CardRule(
      card: card,
      rule: rule,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
