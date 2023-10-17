import 'package:flutter_test/flutter_test.dart';
import 'package:task_advance_form/main.dart';

void main() {
  testWidgets('Textnya adalah ....', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Ensure the title is displayed
    expect(find.text('Contacts'), findsOneWidget);

    expect(
        find.text(
            'Dalam rangka memperluas jaringan dan menjaga komunikasi yang efisien, mari mencatat informasi kontak kolega Anda.'),
        findsOneWidget);
    // Ensure the "Create New Contacts" text is displayed
    expect(find.text('Create New Contacts'), findsOneWidget);

    // Ensure the "Name" field is displayed
    expect(find.text('Name'), findsOneWidget);

    // Ensure the "Phone Number" field is displayed
    expect(find.text('Phone Number'), findsOneWidget);

    // Ensure the "Save" button is displayed
    expect(find.text('Save'), findsOneWidget);

    // Ensure the "List Contacts" button is displayed
    expect(find.text('List Contacts'), findsOneWidget);
  });
}
