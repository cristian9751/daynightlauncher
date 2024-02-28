import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launcher/config/router/router_config.dart';
import 'package:sidebarx/sidebarx.dart';


class SideBar extends StatefulWidget {
   SideBar({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: colorScheme.secondary,
        textStyle: TextStyle(color: colorScheme.onPrimary.withOpacity(0.7)),
        selectedTextStyle: TextStyle(color: colorScheme.onPrimary),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorScheme.primary.withOpacity(0.37),
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.inversePrimary,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: colorScheme.onPrimary.withOpacity(0.7)
        ),
        selectedIconTheme: IconThemeData(
          color: colorScheme.onPrimary
        )

      ),
      extendedTheme:  SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: colorScheme.primary,
        ),
      ),
      headerBuilder: (context, extended) {
        return  SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                "Logo del servidor",
                style: TextStyle(
                  color:  colorScheme.inversePrimary
                ),
            )
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            router.replace('/');
          },
        ),
         SidebarXItem(
          icon: Icons.people,
          label: 'Personajes',
          onTap: () {
            router.replace('/characters');
          }
        ),
      ],
    );
  }
}
