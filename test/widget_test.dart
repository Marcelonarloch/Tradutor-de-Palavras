import 'package:flutter_test/flutter_test.dart';
import 'package:tradutor_palavras/main.dart';

void main() {
  testWidgets('Mostra a primeira palavra e esconde a tradução', (tester) async {
    await tester.pumpWidget(const TradutorApp());

    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('House'), findsNothing);
  });

  testWidgets('Botão mostra a tradução em inglês', (tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Mostrar tradução'));
    await tester.pump();

    expect(find.text('House'), findsOneWidget);
  });

  testWidgets('Botão Próxima avança para a próxima palavra', (tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Próxima'));
    await tester.pump();

    expect(find.text('Cachorro'), findsOneWidget);
    expect(find.text('Casa'), findsNothing);
  });
}
