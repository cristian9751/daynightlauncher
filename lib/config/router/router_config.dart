import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:launcher/presentation/screens/character_screen.dart';

import '../../presentation/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        name: "Main",
        path: '/',
        builder: (BuildContext context, state) => const HomeScreen()
    ),
    GoRoute(
      name: "Characters",
      path: '/characters',
      builder: (BuildContext context, state) => const CharacterScren()
    )
  ]
);