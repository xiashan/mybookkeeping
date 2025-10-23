// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookkeeping/app.dart';

void main() {
  testWidgets('主页加载明细视图', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: BookkeepingApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('记账'), findsWidgets);
    expect(find.text('明细'), findsWidgets);
    expect(find.byIcon(Icons.add), findsWidgets);
  });
}
