// lib/config/router/app_router.dart

import 'package:cuartoreydif/presentation/screens/card_assignment_screen.dart';
import 'package:cuartoreydif/presentation/screens/intro_screen.dart';
import 'package:cuartoreydif/presentation/screens/player_selection_screen.dart';
import 'package:go_router/go_router.dart';
// Importar tus pantallas aquí

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => IntroScreen(),
    ),
    GoRoute(
      path: '/playerSelection',
      builder: (context, state) => PlayerSelectionScreen(),
    ),
    GoRoute(
      path: '/cardAssignment',
        builder: (context, state) => CardAssignmentScreen(),
    )
    // Otras rutas
  ],
);
