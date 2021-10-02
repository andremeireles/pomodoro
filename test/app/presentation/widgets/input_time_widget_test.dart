import 'package:pomodoro/app/presentation/widgets/input_time_widget.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('InputTimeWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(InputTimeWidget(
        title: 'T',
        value: 0,
      ));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
