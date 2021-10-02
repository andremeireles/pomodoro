import 'package:pomodoro/app/domain/pomodoro_store.dart';
import 'package:pomodoro/app/presentation/widgets/stopwatcher_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('StopwatcherWidget -', () {
    testWidgets('Has a title', (WidgetTester tester) async {
      await tester.pumpWidget(
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
          child: StopWatcherWidget(title: 'Work Time'),
        ),
      );
      final titleFinder = find.text('Work Time');
      expect(titleFinder, findsOneWidget);
    });
  });
}
