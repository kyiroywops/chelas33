import 'package:cuartoreydif/infrastructure/repositories/cardrules_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final kaiserCounterProvider = StateProvider<int>((ref) => 0);

final cardRulesProvider = Provider((ref) {
  return CardRulesRepository();
});