
import 'package:calculadora_IMC/utils/keys.dart';
import 'package:calculadora_IMC/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculadora IMC Test Widegt', (WidgetTester tester) async {
    await tester.pumpWidget(CalculadoraIMC());

    expect(find.byKey(Key(Keys.scaffoldHomeView)), findsOneWidget);

    expect(find.byKey(Key(Keys.textFormFieldName)), findsOneWidget);
    expect(find.byKey(Key(Keys.textFormFieldWeight)), findsOneWidget);
    expect(find.byKey(Key(Keys.textFormFieldHeight)), findsOneWidget);

    expect(find.byKey(Key(Keys.buttonCalculate)), findsOneWidget);
    expect(find.byKey(Key(Keys.buttonClear)), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);

    await tester.enterText(find.byKey(Key(Keys.textFormFieldWeight)), '70.0');
    await tester.enterText(find.byKey(Key(Keys.textFormFieldHeight)), '1.94');

    await tester.tap(find.byKey(Key(Keys.buttonCalculate)));

    await tester.pump();

    expect(find.byKey(Key(Keys.AlertDialogResult)), findsOneWidget);
    expect(find.text('18.6'), findsOneWidget);

    await tester.tap(find.byKey(Key(Keys.buttonRecalculate)));

    await tester.pump();

    expect(find.byKey(Key(Keys.AlertDialogResult)), findsNothing);

    await tester.tap(find.byKey(Key(Keys.buttonClear)));

    await tester.pump();

    expect(find.byType(HomeView), findsOneWidget);
  });
}
