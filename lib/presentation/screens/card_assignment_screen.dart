import 'package:cuartoreydif/infrastructure/models/cardrule_models.dart';
import 'package:cuartoreydif/infrastructure/models/player_models.dart';
import 'package:cuartoreydif/infrastructure/repositories/cardrules_repository.dart';
import 'package:cuartoreydif/presentation/providers/cardrules_providers.dart';
import 'package:cuartoreydif/presentation/providers/current_rule_provider.dart';
import 'package:cuartoreydif/presentation/providers/deck_provider.dart';
import 'package:cuartoreydif/presentation/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playing_cards/playing_cards.dart';

class CardAssignmentScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PlayingCard> deck = ref.watch(deckProvider);
    CardRule? currentRule = ref.watch(currentRuleProvider);
    List<Player> players = ref.watch(playerProvider);
    int currentPlayerIndex = ref.watch(currentPlayerIndexProvider);

    final chanchoInfladoCountProvider = StateProvider<int>((ref) => 0);



    Player currentPlayer = players.isNotEmpty ? players[currentPlayerIndex] : Player(avatar: '', name: 'Sin Jugador');

     bool isChanchoInfladoRule = currentRule?.rule == 'Chancho Inflado';
      int chanchoInfladoCount = ref.watch(chanchoInfladoCountProvider);

   void handleDrawCard() {
    if (deck.isNotEmpty) {
      // Saca la carta superior de la baraja y obtiene la regla correspondiente
      PlayingCard drawnCard = deck.first;
      CardRule? rule = CardRulesRepository.getRuleForCard(drawnCard.value.toString());
      ref.read(currentRuleProvider.notifier).state = rule;
      
      // Si la carta es un Kaiser, actualiza el contador
      if (drawnCard.value == CardValue.king) {
        int currentKaisers = ref.read(kaiserCounterProvider.state).state;
        currentKaisers = (currentKaisers + 1) % 4; // Reinicia a 0 después de llegar a 4
        ref.read(kaiserCounterProvider.state).state = currentKaisers;

        // Si es el cuarto Kaiser, ejecuta la acción de "tomar el vaso completo"
        if (currentKaisers == 0) {
          // Aquí podrías mostrar un mensaje, abrir un diálogo o actualizar la UI
          // para reflejar que se debe tomar el vaso completo
          // ...
        }
      }

            // Si la carta es "Chancho Inflado", aumenta el contador
      if (rule?.rule == 'Chancho Inflado') {
        ref.read(chanchoInfladoCountProvider.notifier).state++;
      } else {
        // Si la carta no es "Chancho Inflado", reinicia el contador
        ref.read(chanchoInfladoCountProvider.notifier).state = 0;
      }
    
      
      // Elimina la carta del estado del deckProvider
      ref.read(deckProvider.notifier).drawCard();
     
    }
  }


    void showRuleDialog() {
      if (currentRule != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(currentRule.rule),
              content: SingleChildScrollView( // Asegura que el contenido sea desplazable si es muy largo
                child: ListBody(
                  children: <Widget>[
                    Text(currentRule.message),
                    // Aquí puedes añadir más widgets si necesitas mostrar más información
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
    

    // Obtén el contador actual de Kaisers
  int currentKaisers = ref.watch(kaiserCounterProvider);

   
    // Estado para controlar la cantidad de veces que se ha sacado una carta
    
       return Scaffold(
      backgroundColor: Color(0xFF002D40),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SafeArea( // Asegúrate de que los elementos no queden debajo de la barra de estado
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    // Acción para terminar la partida
                  },
                ),
                Spacer(),
                 Expanded( // Usa Expanded para que el contenedor de Kaisers pueda moverse hacia la derecha
          child: Align(
            alignment: Alignment.centerRight, // Alinea el contenedor a la derecha
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.90), // Fondo blanco del container
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  'Kaisers $currentKaisers de 4',
                  style: TextStyle(
                    color: Colors.black, // Texto negro
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,

                  ),
                ),
              ),
            ),
          ),
        ),
              ],
            ),
          ),
        ),
            
            if (deck.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                width: MediaQuery.of(context).size.width * 0.7, // 70% del ancho de la pantalla
                height: MediaQuery.of(context).size.height * 0.4, // 40% del alto de la pantalla
                child: PlayingCardView(card: deck.first),
                            ),
              ),
            if (currentRule != null) 
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(currentRule.rule, style: TextStyle(fontSize: 24, fontFamily: 'Lexend', color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            if (currentRule != null) 
            Padding(  
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: IconButton(
                icon: Icon(Icons.help_rounded, size: 32),
                onPressed: showRuleDialog,
                color: Colors.white,
              ),
            ),
             // Verifica si la regla actual es "Chancho Inflado" y muestra el botón si el contador es menor que el número de jugadores
         if (isChanchoInfladoRule && chanchoInfladoCount < players.length)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                ref.read(chanchoInfladoCountProvider.notifier).state++;
              },
              child: Text('Chancho Inflado ${chanchoInfladoCount + 1}/${players.length}'),
            ),
          ),
                      
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(currentPlayer.avatar),
                      radius: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(currentPlayer.name, style: TextStyle(fontSize: 20, fontFamily: 'Lexend', color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: handleDrawCard,
                child: Text("Sacar Carta", style: TextStyle(fontSize: 20, fontFamily: 'Lexend', color: Color(0xFF002D40))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
