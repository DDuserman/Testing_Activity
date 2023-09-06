// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:f_testing_template/ui/pages/authentication/signup.dart';
import 'package:f_testing_template/ui/pages/content/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Widget login validación @ email', (WidgetTester tester) async {
    //LoginScreen
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(email: 'blank', password: 'blank'),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'correo.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), 'seiscaracteres');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter valid email address'), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget login validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(email: 'blank', password: 'blank'),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), 'seiscaracteres');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter email'), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget login validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(email: 'blank', password: 'blank'),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'correo@correo.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Password should have at least 6 characters'),
        findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget login validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(email: 'blank', password: 'blank'),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'correo@correo.com');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter password'), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget login autenticación exitosa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(email: 'blank', password: 'blank'),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'correo@correo.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.byKey(const Key('LoginScreen')), findsNothing);
    Get.deleteAll();
  });

  testWidgets('Widget login autenticación no exitosa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginScreen(email: 'blank', password: 'blank'),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'correo@correo.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.byKey(const Key('HomePage')), findsNothing);
    Get.deleteAll();
  });

  testWidgets('Widget signUp validación @ email', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: SignUpPage(),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'correo.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), 'seiscaracteres');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter valid email address'), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget signUp validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: SignUpPage(),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), 'seiscaracteres');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter email'), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget signUp validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: SignUpPage(),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'correo@correo.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '1234');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Password should have at least 6 characters'),
        findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget signUp validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: SignUpPage(),
    ));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'correo@correo.com');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter password'), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget home visualización correo', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home:
          HomePage(loggedEmail: 'correo@correo.com', loggedPassword: '1234567'),
    ));

    expect(find.byKey(const Key('TextHomeHello')), findsOneWidget);
    Get.deleteAll();
  });

  testWidgets('Widget home nevegación detalle', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home:
          HomePage(loggedEmail: 'correo@correo.com', loggedPassword: '1234567'),
    ));

    await tester.tap(find.byKey(const Key('ButtonHomeDetail')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('DetailPage')), findsOneWidget);
  });

  testWidgets('Widget home logout', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home:
          HomePage(loggedEmail: 'correo@correo.com', loggedPassword: '1234567'),
    ));

    await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
  });
}
