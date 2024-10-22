import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'Theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
         IconButton(
            //icon: Icon(Icons.light_mode_outlined),
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined), // ICON DE TEMA OSCURO Y CLARO Y TERNARIO
            onPressed: () {
              ref.read(isDarkmodeProvider.notifier)
              .update((state) => !state);
            })
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
      final Color color = colors[index];

      return RadioListTile(
        title: Text('Este color', style: TextStyle(color: color)),
        subtitle: Text('${color.value}'),
        activeColor: color,
        value: index, 
        groupValue: selectedColor, 
        onChanged: (value) {
        ref.read(selectedColorProvider.notifier).state = index;
            },
          );
        },
      );
    }
  }