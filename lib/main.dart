import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
  doWhenWindowReady(() {
    const initialSize = Size(400, 650);
    appWindow.alignment = Alignment.center;
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = const Size(400, 650);
    appWindow.title = 'Pomodoro plus plus';
    appWindow.show();
  });
}
