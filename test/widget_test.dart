// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:autc_app/main.dart';

void main() {
  testWidgets('User login and display test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(UserProfileApp()); // Заменено с MyApp на UserProfileApp

    // Verify that the initial screen shows the auth screen.
    expect(find.text('Authorization'), findsOneWidget);

    // Enter user email and password.
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    // Tap the sign in button and trigger a frame.
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Verify that the main screen is displayed with user information.
    expect(find.text('Welcome to the main screen!'), findsOneWidget);
  });
}
