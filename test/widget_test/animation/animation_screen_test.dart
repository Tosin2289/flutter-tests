import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftests/widget_test/animation/animation_screen.dart';

void main() {
  testWidgets('animation screen test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AbimationScreen()));
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var container = tester.widget<Container>(containerFinder);

    ///Initial
    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.zero);
    await tester.pumpAndSettle();
    containerFinder = find.byType(Container);
    container = tester.widget<Container>(containerFinder);

    ///Final
    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(50));
  });
}
