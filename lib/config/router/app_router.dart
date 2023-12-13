// lib/config/router/app_router.dart

import 'package:cuartoreydif/presentation/screens/card_assignment_screen.dart';
import 'package:cuartoreydif/presentation/screens/intro_screen.dart';
import 'package:cuartoreydif/presentation/screens/player_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Importar tus pantallas aquí

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
     GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => IntroScreen(),
    ),
    GoRoute(
      path: '/playerSelection',
      builder: (BuildContext context, GoRouterState state) => PlayerSelectionScreen(), // Asegúrate de que esta pantalla exista
    ),
    GoRoute(
      path: '/cardAssignment',
        builder: (context, state) => CardAssignmentScreen(),
    )
    // Otras rutas
  ],
);
