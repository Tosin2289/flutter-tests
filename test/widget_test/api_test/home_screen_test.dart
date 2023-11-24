import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftests/widget_test/api_test/home_screen.dart';
import 'package:ftests/widget_test/api_test/user_model.dart';

void main() {
  testWidgets('Display List of users', (tester) async {
    final users = [
      User(email: 'testone@gmail.com', name: 'Test1', id: 1),
      User(email: 'testtwo@gmail.com', name: 'Test2', id: 2),
    ];
    Future<List<User>> mockFetchUsers() async {
      return users;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          futureUsers: mockFetchUsers(),
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));
    for (final user in users) {
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}
