import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launcher/presentation/widgets/custom_progress.dart';
import 'package:launcher/presentation/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Provider.of<AuthProvider>(context).supabase == null
        ? CustomProgressIndicator()
        : const HomeView();


  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Banner"),
          const Text("Horas jugadas"),
          SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Unirse al servidor"),
            ),
          )
        ],
      ),
    );
  }
}


