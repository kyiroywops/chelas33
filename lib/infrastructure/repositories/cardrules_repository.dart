import 'package:cuartoreydif/infrastructure/models/cardrule_models.dart';

class CardRulesRepository {
  static final List<CardRule> allCardRules = [
    CardRule(
      cardName: 'As',
      rule: 'Todos toman',
      message: 'Todos deben tomar un sorbo',
      difficulty: 'Facil',
      card:'ace'
      
    ), 
    CardRule(
      cardName: '2',
      rule: 'Patos',
      message: 'Deben seguir la secuencia de un pato, dos patas, pum, al agua.',
      difficulty: 'Facil',
      card: 'two'

    ), 
    CardRule(
      cardName: '3',
      rule: 'Limones',
      message: 'Cada jugador es asignado con un numero, cada uno debe decir a quien le quiere.',
      difficulty: 'Medio',
      card: 'three'
      
    ),   
    CardRule(
      cardName: '4',
      rule: 'Nunca nunca',
      message: 'El jugador debe inventar un nunca nunca, pueden jugar una ronda si es que lo desean.',
      difficulty: 'Facil', 
      card: 'four'

    ),     
    CardRule(
      cardName: '5',
      rule: 'Cultura chupistica',
      message: 'El jugador debe decir una cultura chupistica.',
      difficulty: 'Facil', 
      card: 'five'
    ),   
    CardRule(
      cardName: '6',
      rule: 'Chancho inflado',
      message: 'El jugador debe decir un chancho inflado.',
      difficulty: 'Facil',
      isRoundActive: false, 
      card: 'six'
    ),     
    CardRule(
      cardName: '7',
      rule: 'Siete',
      message: 'Cada jugador debe no puede decir 7 ni multiplos de 7.',
      difficulty: 'Facil', 
      card: 'seven'
    ),
     CardRule(
      cardName: '8',
      rule: 'Silabas',
      message: 'Cada jugador debe decir y finalizar con la silaba del otro.',
      difficulty: 'Medio', 
      card: 'eight'
    ),
    CardRule(
      cardName: '9',
      rule: 'Vikingo',
      message: 'El jugador debe hacer el gesto del vikingo.',
      difficulty: 'Dificil', 
      card: 'nine'
    ),
     CardRule(
      cardName: '10',
      rule: 'Regla',
      message: 'El jugador puede agregar una regla que dura la ronda entera',
      difficulty: 'Facil',
      isRoundActive: true, 
      card: 'ten'
    ),
    CardRule(
      cardName: 'J',
      rule: 'Palos romanos',
      message: 'El jugador debe nombrar un palo romano.',
      difficulty: 'Facil', 
      card: 'jack'
    ),
    CardRule(
      cardName: 'Q',
      rule: 'Historia',
      message: 'El jugador debe contar una historia y el companero de la derecha seguirlo.',
      difficulty: 'Facil', 
      card: 'queen'
    ),
    CardRule(
      cardName: 'K',
      rule: 'Cuarto de Rey',
      message: 'El jugador debe donar un cuarto de su trago en el vaso del medio, el que saque el cuarto kaiser se lo debe tomar al seco y el juego termina.',
      difficulty: 'Dios griego', 
      card: 'king'
    ),



  ];

  // Puedes agregar métodos para obtener reglas basadas en la carta
  static CardRule? getRuleForCard(String cardValue) {
    return allCardRules.firstWhere(
      (rule) => rule.card == cardValue,
      orElse: () => CardRule(
        cardName: 'Unknown',
        card: 'Default',
        rule: 'No rule found',
        message: 'No message',
        gameState: 'No game state',
        difficulty: 'Unknown',
      ),
    );
  }
}
