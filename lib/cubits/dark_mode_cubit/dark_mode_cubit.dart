import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/cubits/dark_mode_cubit/dark_mode_states.dart';

class DarkModeCubit extends Cubit<modes> {
  DarkModeCubit() : super(lightModeStates());
  bool darkMode = false;
  void ModeController() {
    if (darkMode == true) {
      darkMode = false;
    } else {
      darkMode = true;
    }
    emit(darkMode ? darkModeStates() : lightModeStates());
  }
}
