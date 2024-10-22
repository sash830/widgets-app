import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean mantener un estado
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple int (entero) mantener un estado
final selectedColorProvider = StateProvider((ref) => 0);



// Un objeto de tipo AppTheme (custom) mantener un estado pero mas complejo.
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
    (ref) => ThemeNotifier(), 
    ); 


// Controles o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
    // STATE = Estado = new AppTheme();
  ThemeNotifier():super (AppTheme());


  void toggleDarkmode(){
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex (int colorindex) {
    state = state.copyWith(selectedColor: colorindex);
  }


}