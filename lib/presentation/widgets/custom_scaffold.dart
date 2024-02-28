import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launcher/presentation/widgets/side_bar.dart';
import 'package:launcher/provider/theme_provider.dart';
import 'package:launcher/provider/theme_provider.dart';
import 'package:launcher/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
      final session = context.watch<AuthProvider>().session;
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle = TextStyle(
        color: colorScheme.inversePrimary
      );
      return Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          title: Text(
            "Launcher Daynight RP",
            style: textStyle,

          ),
          actions:  [
            Text("Cambiar a tema oscuro", style: textStyle),
            Switch(
                value: Provider.of<ThemeProvider>(context).isDarkModeEnabled,
                onChanged: (bool value) {
                  Provider.of<ThemeProvider>(context, listen:  false).toggleDarkTheme();
                },
            ),
            session == null ?
            FilledButton(onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).signInWithDiscord();
            }, child: const Text("Iniciar sesion")
            )
                :
            FilledButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                },
                child: const Text("Cerrar session")
            )
          ]
        ),
        body: Row(
          children: [
            SideBar(),
            Expanded(child: content)
          ],
        )
      );
  }
}
