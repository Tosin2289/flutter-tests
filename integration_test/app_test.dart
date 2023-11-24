import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftests/integration_tests/login/home_page.dart';
import 'package:ftests/screens/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ftests/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end to end test', () {
    testWidgets(
      'verifiy login screen with corect username and pasword',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        await tester.enterText(find.byType(TextField).at(0), "username");
        await Future.delayed(const Duration(seconds: 2));

        await tester.enterText(find.byType(TextField).at(1), "12345");
        await Future.delayed(const Duration(seconds: 2));
        await tester.tap(find.byType(ElevatedButton));
        await Future.delayed(const Duration(seconds: 2));
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        expect(find.byType(HomeScreen), findsOneWidget);
      },
    );
    testWidgets(
      'verifiy login screen with incorrct username and pasword',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        await tester.enterText(find.byType(TextField).at(0), "user");
        await Future.delayed(const Duration(seconds: 2));

        await tester.enterText(find.byType(TextField).at(1), "passhei");
        await Future.delayed(const Duration(seconds: 2));
        await tester.tap(find.byType(ElevatedButton));
        await Future.delayed(const Duration(seconds: 2));
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        expect(find.text('Invalid username or password'), findsOneWidget);
      },
    );
  });
}
