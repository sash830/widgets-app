import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/widgets/side_menu.dart';
//import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';


class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey,)
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    

    // Text: ('nombre);
    // ListTile

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context,index) {
        final menuItem = appMenuItems[index];

        return _CustomListTitle(menuItem: menuItem);
      }
      );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () { // pantallas de la app
        // Flutter:
       //  Navigator.of(context).push( // push: poner una dentro de otra
       //     MaterialPageRoute(
       //       builder: (context) => const ButtonsScreen(),
       //     ),
       //   );
        //Navigator.pushNamed(context, menuItem.link);

        // go_Router:
        // context.pushNamed(CardsScreen.name);
        context.push(menuItem.link);

       

      },
    );
  }
}