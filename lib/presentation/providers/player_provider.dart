
import 'package:cuartoreydif/infrastructure/models/player_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider = StateProvider<List<Player>>((ref) => []);
