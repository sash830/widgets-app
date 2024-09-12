import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context ){

    ScaffoldMessenger.of(context).clearSnackBars();

    // ignore: prefer_const_constructors
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: const Duration(seconds: 2),
      );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Sit excepteur magna officia sunt aliqua ex eiusmod veniam. Tempor aliqua ullamco exercitation laboris voluptate magna dolore non ipsum Lorem laboris. Adipisicing velit exercitation amet eu sit. Fugiat aute qui commodo consectetur dolor cupidatat est et exercitation. Ipsum dolore labore quis laboris elit irure Lorem dolor duis excepteur. Tempor excepteur eu do do irure dolore duis irure elit ut ut cupidatat do. Laborum quis sit irure reprehenderit labore exercitation nisi et et pariatur.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          
          FilledButton(onPressed:()=> context.pop(), child: const Text('Aceptar'))
        ],
      ),
      ); // builder se construye en tiempo de ejecucion.
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Snackbars y Diálogos '),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(
                context: context,
                children: [
                  const Text('Tempor culpa duis nostrud ipsum nisi esse voluptate. Tempor tempor ea nisi cupidatat tempor. Eu voluptate ea cupidatat ipsum in. Veniam adipisicing ipsum ex non ullamco ex. Pariatur reprehenderit anim irure aliqua exercitation ullamco laborum.')
                ]
                );
            }, child: const Text('Licencias usadas')),

             FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo'))
          ],
          ) 
        ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined), // widget que sirve pa mostar iconos y dentro la informacion de tal.
          onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}