import 'package:flutter_test/flutter_test.dart';
import 'package:landon_airport/home.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(CupertinoStoreApp());
    expect(find.text('Cupertino Store'), findsOneWidget);
  });
}
