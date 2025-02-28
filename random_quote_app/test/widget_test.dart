import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_quote_app/main.dart';

void main() {
  testWidgets('Displays a quote when the Fetch button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Press the button to get a quote!'), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.byType(Text), findsWidgets);
  });
}
