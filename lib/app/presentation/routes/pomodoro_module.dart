import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/pomodoro_store.dart';

import '../pages/pomodoro_page.dart';

class PomodoroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PomodoroStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PomodoroPage()),
  ];
}
