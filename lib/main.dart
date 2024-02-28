import 'package:flutter/material.dart';
import 'package:launcher/config/router/router_config.dart';
import 'package:launcher/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

void main() => runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider()..initialize(),
    )
  ],
      child: const MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const colorSeed =  Color(0xFF123456);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Launcher Daynight RP',
      theme : ThemeData(
        colorSchemeSeed: colorSeed,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSeed,
        brightness: Brightness.dark
      ),
      themeMode: context.watch<ThemeProvider>().isDarkModeEnabled ? ThemeMode.dark
      : ThemeMode.light,
    );
  }
}
