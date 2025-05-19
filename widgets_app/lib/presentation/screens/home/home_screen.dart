import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final meunItem = appMenuItems[index];

        return _CustomListTile(meunItem: meunItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItems meunItem;

  const _CustomListTile({required this.meunItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(meunItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(meunItem.title),
      subtitle: Text(meunItem.subtitle),
      onTap: () {
        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => const ButtonsScreen()));

        // Navigator.pushNamed(context, meunItem.link);

        // context.pushNamed(CardsScreen.name);
        context.push(meunItem.link);
      },
    );
  }
}
